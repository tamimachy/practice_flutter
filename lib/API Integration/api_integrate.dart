import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

String stringResponse = '';
Map mapResponse = {};

class Api extends StatefulWidget {
  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  Future apicall() async {
    http.Response response;
    response = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    if (response.statusCode == 200) {
      setState(() {
        String stringResponse = response.body;
        // mapResponse = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api Demo"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          color: Colors.orange,
          height: 400,
          width: 300,
          alignment: Alignment(0, 0),
          child: Center(
            child: Text("${stringResponse.toString()}"),
          ),
        ),
      ),
    );
  }
}
