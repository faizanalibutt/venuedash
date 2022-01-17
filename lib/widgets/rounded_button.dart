import 'package:flutter/material.dart';
import 'package:venuedash2/utils/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final String imgName;
  const RoundedButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.black,
    required this.imgName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: size.width * 0.42,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 4,
              blurRadius: 14,
              offset: Offset(0, 3),
            )
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(14),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgName),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: textColor),
          )
        ],
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: kPrimaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          textStyle: TextStyle(
              color: textColor, fontSize: 12, fontWeight: FontWeight.w500)),
    );
  }
}
