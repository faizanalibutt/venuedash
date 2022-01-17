import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  final Color borderColor;

  const TextFieldContainer({
    Key? key,
    required this.child, this.borderColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 3),
      padding: const EdgeInsets.only(left: 22.0, right: 5.0),
      width: size.width * 0.85,
      height: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor, width: 1.0),
        borderRadius: const BorderRadius.all(Radius.circular(30.0)),
      ),
      child: child,
    );
  }
}
