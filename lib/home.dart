import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    dotenv.load();
    (fileName: "lib/.env");
  }

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
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Report')),
      body: FutureBuilder(
        future: _determinePosition(),
        builder: (context, snapsot) {
          List<Widget> list = [];
          var data = snapsot.data!;
          list.add(Text("lat: ${data.latitude}"));
          list.add(Text("lon: ${data.longitude}"));
          if (snapsot.hasData) {
          } else if (snapsot.hasError) {
            list.add(Text('Error'));
            list.add(Text(snapsot.error.toString()));
          } else {
            list.add(Text("please wait..."));
          }
          return Column(children: list);
        },
      ),
    );
  }
}
