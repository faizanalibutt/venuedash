import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/widgets/custom_alert_confirmation_dialog.dart';
import 'package:venuedash2/widgets/rounded_button_long.dart';
import 'package:venuedash2/widgets/rounded_input_field.dart';

class AddPaymentMethodPage extends StatelessWidget {
  var maskFormatter = MaskTextInputFormatter(
      mask: '####-####-####-####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  AddPaymentMethodPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // optimal solution for this is like recycler-view
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: size.height * .04,
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: size.width,
                height: size.height * .07,
                child: Text("Add Payment Method",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      color: kBlackHeadingColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: size.width * .025,
                  ),
                  SizedBox(
                    width: size.width * .15,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: Image.asset(
                        "assets/graphics/ic_back_button.png",
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: size.height * .87,
            child: Padding(
              child: SingleChildScrollView(
                  child: Column(
                children: [
                  SvgPicture.asset(
                      "assets/graphics/images/add_payment_img.svg"),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.topLeft,
                    child: const Text(
                      "Car Number",
                      style:
                          TextStyle(color: kBlackSubHeadingColor, fontSize: 10),
                    ),
                  ),
                  RoundedInputField(
                      fieldWidth: .9,
                      textInputType: TextInputType.name,
                      onChanged: (value) {},
                      color: kPrimaryColor,
                      textColor: kBlackFieldColor,
                      cursorColor: kPrimaryColor,
                      inputFormatter: maskFormatter),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 20),
                              alignment: Alignment.topLeft,
                              child: const Text(
                                "Valid Till",
                                style: TextStyle(
                                    color: kBlackSubHeadingColor, fontSize: 10),
                              ),
                            ),
                            RoundedInputField(
                              fieldWidth: 1,
                              textInputType: TextInputType.name,
                              onChanged: (value) {},
                              color: kPrimaryColor,
                              textColor: kBlackFieldColor,
                              cursorColor: kPrimaryColor,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 20),
                            alignment: Alignment.topLeft,
                            child: const Text(
                              "CVC",
                              style: TextStyle(
                                  color: kBlackSubHeadingColor, fontSize: 10),
                            ),
                          ),
                          RoundedInputField(
                            fieldWidth: 1,
                            textInputType: TextInputType.name,
                            onChanged: (value) {},
                            color: kPrimaryColor,
                            textColor: kBlackFieldColor,
                            cursorColor: kPrimaryColor,
                          ),
                        ],
                      )),
                    ],
                  ),
                  RoundedButtonLong(
                    buttonWidth: .9,
                    text: "Add a Payment Method",
                    press: () => {
                      Get.dialog(
                        CustomAlertConfirmationDialog(
                          dialogHeight: 240,
                          titleText: "Sucess!",
                          descText: "Payment method added successfully.",
                          buttonText: "Okay",
                          onConfirmPressed: () => Get.back(),
                        ),
                      ),
                    },
                    imgName: 'assets/graphics/images/ic_add_white_icon.svg',
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    onPrimaryColor: Colors.white54,
                    isSVG: true,
                  ),
                ],
              )),
              padding: const EdgeInsets.all(20),
            ),
          ),
        ],
      ),
    );
  }
}
