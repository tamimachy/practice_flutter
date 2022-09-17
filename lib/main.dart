import 'package:august_27/API%20Integration/api_integrate.dart';
import 'package:august_27/API%20Integration/call.dart';
import 'package:august_27/API%20Integration/currentWeather.dart';
import 'package:august_27/data_pass/page_1.dart';
import 'package:august_27/recipe_app_with_api/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'API Integration/weather.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Practice",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,
          textTheme: TextTheme(bodyText2: TextStyle(color: Colors.white))),
      home: CurrentWeatherPage(),
    );
  }
}
