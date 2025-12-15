import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ===== ขอพิกัดตำแหน่ง =====
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    return await Geolocator.getCurrentPosition();
  }

  // ===== UI =====
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Report'), centerTitle: true),
      body: FutureBuilder<Position>(
        future: _determinePosition(),
        builder: (context, snapshot) {
          List<Widget> children = [];

          if (snapshot.hasData) {
            final latitude = snapshot.data!.latitude.toStringAsFixed(3);
            final longitude = snapshot.data!.longitude.toStringAsFixed(3);

            children.add(
              const Icon(Icons.pin_drop, color: Colors.green, size: 40),
            );
            children.add(const SizedBox(height: 12));
            children.add(
              Text('Latitude: $latitude', style: const TextStyle(fontSize: 18)),
            );
            children.add(
              Text(
                'Longitude: $longitude',
                style: const TextStyle(fontSize: 18),
              ),
            );
          } else if (snapshot.hasError) {
            children.add(const Icon(Icons.error, color: Colors.red, size: 40));
            children.add(const SizedBox(height: 12));
            children.add(
              Text(snapshot.error.toString(), textAlign: TextAlign.center),
            );
          } else {
            children.add(const CircularProgressIndicator());
            children.add(const SizedBox(height: 12));
            children.add(const Text('Waiting...'));
          }

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: children,
            ),
          );
        },
      ),
    );
  }
}
