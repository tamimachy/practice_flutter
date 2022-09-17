import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'weather.dart';

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({Key? key}) : super(key: key);

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  bool isLoading = true;

  void didChangeDependencies() {
    Provider.of<WeatherProvider>(context).getCurrentWeatherInfo().then((value) {
      setState(() {
        isLoading = false;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
        builder: (context, value, child) => isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.cyan,
                ),
                // child: Text("${value.getMainWeatherData.main.temp}"),
              ));
  }
}

class WeatherProvider with ChangeNotifier {
  late MainWeatherResponse _mainWeatherResponse;

  MainWeatherResponse get getMainWeatherData => _mainWeatherResponse;

  Future<void> getCurrentWeatherInfo() async {
    String url =
        "https://api.openweathermap.org/data/2.5/weather?q=London&appid=6b3e9eea2d17bbd951cbdeacec45b84e";
    final response = await http.get(Uri.parse(url));
    final map = jsonDecode(response.body);
    // _mainWeatherResponse = MainWeatherResponse.fromMap(map);
    notifyListeners();
  }
}

class MainWeatherResponse {}
