import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:venuedash2/routers/home_page.dart';
import 'package:venuedash2/routers/welcome_page.dart';

void main() => runApp(const VenueDash());

class VenueDash extends StatelessWidget {
  const VenueDash({Key? key}) : super(key: key); 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
