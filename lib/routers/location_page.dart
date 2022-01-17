import 'package:flutter/material.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  _LocationPageState createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            alignment: Alignment.center,
            child: TextButton(
              child: const Text("Set Your Location"),
              onPressed: () => Navigator.pop(context),
            )));
  }
}
