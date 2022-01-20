import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:venuedash2/controller/TextController.dart';

class LocationConfirmPage extends StatelessWidget {
  LocationConfirmPage({Key? key}) : super(key: key);
  final textController = Get.find<TextController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 100,
          ),
          TextField(
            controller: textController.textController,
            autofocus: true,
          ),
          TextButton(
            child: const Text("Search Location"),
            onPressed: () => Get.back(),
          ),
        ]));
  }
}
