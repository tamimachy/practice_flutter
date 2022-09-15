import 'package:august_27/data_pass/page_2.dart';
import 'package:flutter/material.dart';

class DataPassing extends StatefulWidget {
  const DataPassing({key}) : super(key: key);

  @override
  State<DataPassing> createState() => _DataPassingState();
}

class _DataPassingState extends State<DataPassing> {
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _phone = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Field"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
                prefixIcon: Icon(Icons.edit),
                label: Text("Enter Name"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _email,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Email",
                prefixIcon: Icon(Icons.email),
                label: Text("Enter Email"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Phone No.",
                prefixIcon: Icon(Icons.phone),
                label: Text("Enter Phone No."),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (contex) => WelcomePage(
                          name: _name.text,
                          email: _email.text,
                          phone: _phone.text,
                        )));
              },
              child: Text("Go to Welcome Page..."))
        ],
      ),
    );
  }
}
