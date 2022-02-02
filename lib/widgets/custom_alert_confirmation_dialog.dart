import 'package:auto_size_text/auto_size_text.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/widgets/rounded_button_long.dart';

class CustomAlertConfirmationDialog extends StatelessWidget {
  final Function onConfirmPressed;
  final String buttonText;
  final String descText;
  final String titleText;
  final double dialogHeight;

  const CustomAlertConfirmationDialog(
      {Key? key,
      required this.onConfirmPressed,
      this.buttonText = "Okay",
      this.descText = "Any Desc",
      this.titleText = "Success!",
      this.dialogHeight = 270})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0)), //this right here
      child: SizedBox(
        height: dialogHeight,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              FittedBox(
                  child: Text(
                titleText,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  color: kBlackHeadingColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
              )),
              const SizedBox(
                height: 12,
              ),
              SvgPicture.asset("assets/graphics/images/forget_circle_img.svg"),
              const SizedBox(
                height: 12,
              ),
              AutoSizeText(
                descText,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  color: kBlackHeadingColor,
                )),
                minFontSize: 8,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 12,
              ),
              RoundedButtonLong(
                text: buttonText,
                press: () => {Get.back(), onConfirmPressed},
                imgName: "assets/graphics/ic_okay_icon.png",
                textColor: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
