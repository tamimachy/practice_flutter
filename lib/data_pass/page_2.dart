import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  String name, email, phone;

  WelcomePage({required this.name, required this.email, required this.phone});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Page"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Received Data", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
            SizedBox(height: 20,),
            Text("Name: $name"),
            Text("Email: $email"),
            Text("Phone No: $phone")
          ],
        ),
      ),
    );
  }
}
