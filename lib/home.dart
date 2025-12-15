import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:the_weather_report/services/open_weather_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var apiKey = dotenv.env['OPEN_WEATHER_API_KEY'];
    return Scaffold(
      appBar: AppBar(title: Text("Weather Report")),
      body: FutureBuilder(
        future: OpenWeatherService.fetch(apiKey!),
        builder: ((context, snapshot) {
          List<Widget> list = [];
          if (snapshot.hasData) {
            var data = snapshot.data!;
            list.add(
              Center(
                child: Image.network(
                  "https://openweathermap.org/img/wn/${data.weather![0].icon}.png",
                ),
              ),
            );
            list.add(Text("main weather: ${data.weather![0].main}"));
          } else if (snapshot.hasError) {
            list.add(Text("Error !!!"));
            list.add(Text(snapshot.hasError.toString()));
          } else {
            list.add(Text("Please wait..."));
          }
          if (snapshot.hasData) {
            var data = snapshot.data!;
            list.add(Text("สถานที่: ${data.name}"));
            list.add(Text("สภาพอากาศ: ${data.weather![0].main}"));
          }
          return Column(children: list);
        }),
      ),
    );
  }
}
