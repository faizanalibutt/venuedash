import 'package:flutter/material.dart';
import 'package:venuedash2/registration_page.dart';

void main() {
  runApp(const VenueDash());
}

class VenueDash extends StatelessWidget {
  const VenueDash({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: RegistrationPage());
  }
}
