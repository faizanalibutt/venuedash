import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Venu"),
      ),
      body: const Center(
        child: Text("Finally started working on Venue Dash."),
      ),
      drawer: const Drawer(),
    );
  }
}
