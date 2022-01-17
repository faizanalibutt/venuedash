import 'package:flutter/material.dart';

class TextFieldLocationContainer extends StatelessWidget {
  final Widget child;
  final Color borderColor;

  const TextFieldLocationContainer({
    Key? key,
    required this.child,
    this.borderColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 3),
      width: size.width * 0.85,
      height: 50,
      alignment: Alignment.center,
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12,
          spreadRadius: 4,
          blurRadius: 14,
          offset: Offset(0, 3),
        )
      ]),
      child: child,
    );
  }
}
