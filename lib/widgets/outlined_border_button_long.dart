import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:venuedash2/utils/constants.dart';

class OutlinedBorderButtonLong extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final String imgName;
  const OutlinedBorderButtonLong({
    Key? key,
    required this.text,
    required this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    required this.imgName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.85,
      child: ClipRRect(
        child: outlinedBorderButton(context),
      ),
    );
  }

  Widget outlinedBorderButton(BuildContext context) {
    return TextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imgName,
          ),
          const SizedBox(
            width: 10,
          ),
          AutoSizeText(
            text,
            style: TextStyle(
                color: textColor, fontSize: 12, fontWeight: FontWeight.w300),
            minFontSize: 8,
          )
        ],
      ),
      onPressed: press,
      style: ButtonStyle(
          padding:
              MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(17)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14.0),
                  side: const BorderSide(color: Colors.white)))),
    );
  }
}
