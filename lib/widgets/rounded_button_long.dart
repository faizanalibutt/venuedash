import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:venuedash2/utils/constants.dart';

class RoundedButtonLong extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final String imgName;
  final bool isSVG;
  final Color onPrimaryColor;

  const RoundedButtonLong({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.black,
    required this.imgName,
    this.isSVG = false, this.onPrimaryColor = kPrimaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.85,
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
          isSVG ? SvgPicture.asset(imgName) : Image.asset(imgName),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w300),
          )
        ],
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          onPrimary: onPrimaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
          textStyle: TextStyle(color: textColor, fontSize: 11)),
    );
  }
}