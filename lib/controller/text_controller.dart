import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TextController extends GetxController {
  final textController = TextEditingController();
  RxString controllerTextValue = ''.obs;

  @override
  void onInit() {
    super.onInit();
    textController.addListener(() {
      controllerTextValue.value = textController.text;
    });
  }
}
