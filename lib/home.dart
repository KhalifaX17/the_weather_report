import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:the_weather_report/services/open_weather_services.dart';

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

  @override
  Widget build(BuildContext context) {
    var apiKey = dotenv.env['OPEN_WEATHER_API_KEY'];
    return Scaffold(
      appBar: AppBar(title: const Text('Weather Report')),
      body: FutureBuilder(
        future: OpenWeatherService.fetch(apiKey!),
        builder: (context, snapsot) {
          List<Widget> list = [];
          var data = snapsot.data!;
          list.add(Text("main weather: ${data.weather![0].main}"));
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

extension on Object {
  get latitude => null;

  get longitude => null;
}
