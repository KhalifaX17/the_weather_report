import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:the_weather_report/services/open_weather_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weather Report")),
      body: FutureBuilder(
        future: OpenWeatherService().fetch(),
        builder: ((context, snapshot) {
          List<Widget> list = [];
          if (snapshot.hasData) {
            var data = snapshot.data!;
            var img = CachedNetworkImage(
              imageUrl:
                  "https://openweathermap.org/img/wn/${data.weather![0].icon}.png",
              progressIndicatorBuilder: (context, url, progress) =>
                  Center(child: Text("watting")),
            );
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
