import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:venuedash2/utils/dimensions.dart';
import 'package:venuedash2/utils/styles.dart';
import 'package:venuedash2/widgets/rounded_button_long.dart';

class ConfirmationDialog2 extends StatelessWidget {
  final String icon;
  final double iconSize;
  final String? title;
  final String description;
  final Function onYesPressed;
  final Function? onNoPressed;

  const ConfirmationDialog2({Key? key, 
    required this.icon,
    this.iconSize = 50,
    this.title,
    required this.description,
    required this.onYesPressed,
    this.onNoPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL)),
      child: Padding(
        padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_LARGE),
            child: Image.asset(icon, width: iconSize, height: iconSize),
          ),
          title != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Dimensions.PADDING_SIZE_LARGE),
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: robotoMedium.copyWith(
                        fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                        color: Colors.red),
                  ),
                )
              : const SizedBox(),
          Padding(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_SMALL),
            child: Text(description,
                style:
                    robotoMedium.copyWith(fontSize: Dimensions.FONT_SIZE_LARGE),
                textAlign: TextAlign.center),
          ),
          const SizedBox(height: Dimensions.PADDING_SIZE_LARGE),
          Row(children: [
            Expanded(
              child: RoundedButtonLong(
                text: "Deny",
                press: () {
                  Get.back();
                  onNoPressed!();
                },
                
                textColor: Colors.white,
              ),
            ),
            const SizedBox(width: Dimensions.PADDING_SIZE_LARGE),
            Expanded(
              child: RoundedButtonLong(
                text: "Okay",
                press: () => onYesPressed(),
                
                textColor: Colors.white,
              ),
            ),
          ])
        ]),
      ),
    );
  }
}
