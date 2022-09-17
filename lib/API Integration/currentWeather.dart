import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'weather.dart';

class CurrentWeatherPage extends StatefulWidget {
  const CurrentWeatherPage({Key? key}) : super(key: key);

  @override
  State<CurrentWeatherPage> createState() => _CurrentWeatherPageState();
}

class _CurrentWeatherPageState extends State<CurrentWeatherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: FutureBuilder(
            builder: (context, AsyncSnapshot snapshot) {
              // ignore: unnecessary_null_comparison
              if (snapshot != null) {
                Weather _weather = snapshot.data;
                // ignore: unnecessary_null_comparison
                if (_weather == null) {
                  return const Text("Error getting weather");
                } else {
                  return weatherBox(_weather);
                }
              } else {
                return const CircularProgressIndicator();
              }
            },
            future: getCurrentWeather(),
          ),
        ));
  }
}

Widget weatherBox(Weather _weather) {
  return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
    Container(
        margin: const EdgeInsets.all(10.0),
        child: Text(
          "${_weather.temp}°C",
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
        )),
    Container(
        margin: const EdgeInsets.all(5.0),
        child: Text("${_weather.description}")),
    Container(
        margin: const EdgeInsets.all(5.0),
        child: Text("Feels:${_weather.feelsLike}°C")),
    Container(
        margin: const EdgeInsets.all(5.0),
        child: Text("H:${_weather.high}°C L:${_weather.low}°C")),
  ]);
}

Future getCurrentWeather() async {
  late Weather weather;
  String city = "california";
  String apiKey = "c1cb9cfc32821fdbec26f1ccf9f8ee05";
  var url = Uri.parse(
      "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric");

  final response = await http.get(url);

  if (response.statusCode == 200) {
    weather = Weather.fromJson(jsonDecode(response.body));
  }
  return weather;
}
