import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/utils/dimensions.dart';
import 'package:venuedash2/widgets/outlined_border_button.dart';
import 'package:venuedash2/widgets/rounded_button_long.dart';

class CustomActionDialog extends StatelessWidget {
  final String iconVe, iconNve, icon;
  final String? title;
  final String description;
  final String titleBtnNo;
  final String titleBtnYes;
  final Function onYesPressed;
  final Function? onNoPressed;

  const CustomActionDialog({
    Key? key,
    this.icon = "assets/graphics/images/forget_circle_img.svg",
    this.iconVe = "assets/graphics/ic_cancle_icon.png",
    this.iconNve = "assets/graphics/ic_cancle_icon.png",
    this.title,
    required this.description,
    required this.onYesPressed,
    this.onNoPressed,
    this.titleBtnNo = "Deny",
    this.titleBtnYes = "OKay",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          title != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_LARGE),
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      color: kBlackHeadingColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            child: Image.asset(icon),
          ),
          AutoSizeText(
            description,
            style: GoogleFonts.lato(
                textStyle:
                    const TextStyle(color: kBlackDescColor, fontSize: 12)),
            minFontSize: 8,
            maxLines: 3,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
          Row(children: [
            Expanded(
              child: OutlinedBorderButton(
                text: titleBtnNo,
                press: () {
                  Get.back();
                  onNoPressed;
                },
                textColor: kPrimaryColor,
                borderColor: kPrimaryColor,
                imgName: iconNve,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: RoundedButtonLong(
                buttonWidth: 1,
                text: titleBtnYes,
                press: () => onYesPressed(),
                textColor: Colors.white,
                imgName: iconVe,
              ),
            ),
          ])
        ]),
      ),
    );
  }
}
