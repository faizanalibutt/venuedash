import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venuedash2/routers/add_payment_method_page.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/widgets/custom_action_dialog.dart';
import 'package:venuedash2/widgets/custom_alert_confirmation_dialog.dart';
import 'package:venuedash2/widgets/rounded_button_long.dart';

class PaymentPage extends StatelessWidget {
  static const List<String> paymentCardNames = [
    "PayPal - 3492",
    "MasterCard - 7432",
    "MasterCard - 4444",
    "PayPal - 2215",
  ];
  static const List<String> paymentIcons = ["soon will be loaded."];

  const PaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // optimal solution for this is like recycler-view
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: size.height * .035,
          ),
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: size.width,
                height: size.height * .07,
                child: Text("Payment Methods",
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
                    width: size.width * .03,
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
                    SizedBox(
                      height: size.height * .4,
                      child: MediaQuery.removePadding(
                        context: context,
                        removeTop: true,
                        child: ListView.builder(
                          itemBuilder: (context, position) {
                            // put actual list instead of. here you can
                            // add any view just made it and that's it for
                            // design side.
                            return Column(
                              children: [
                                Ink(
                                  width: size.width,
                                  decoration: const BoxDecoration(
                                    color: kLoationFiedlBgColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                  ),
                                  child: InkWell(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(16)),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                                child: Image.asset(
                                                    "assets/graphics/ic_paypal_icon.png"),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  paymentCardNames[position],
                                                  style: GoogleFonts.lato(
                                                    textStyle: const TextStyle(
                                                        color:
                                                            kBlackHeadingColor,
                                                        fontSize: 14,
                                                        overflow: TextOverflow
                                                            .ellipsis),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          width: size.width * .74,
                                        ),
                                        SizedBox(
                                          child: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 3),
                                            child: InkWell(
                                              onTap: () {
                                                Get.dialog(
                                                    CustomActionDialog(
                                                      icon:
                                                          "assets/graphics/images/delete_payment_img.svg",
                                                      isSvg: true,
                                                      title: "Delete Payment Method?",
                                                      description:
                                                          "Are you sure you want to delete this payment method?",
                                                      iconVe:
                                                          "assets/graphics/ic_delete_icon_white.png",
                                                      iconNve:
                                                          "assets/graphics/ic_cancel_icon.png",
                                                      titleBtnYes: "Delete",
                                                      titleBtnNo: "No",
                                                      onYesPressed: () {
                                                        Get.back();
                                                        Get.dialog(
                                                          CustomAlertConfirmationDialog(
                                                            dialogHeight: 240,
                                                            titleText:
                                                                "Sucess!",
                                                            descText:
                                                                "Payment method deleted successfully.",
                                                            buttonText: "Okay",
                                                            onConfirmPressed:
                                                                () {},
                                                          ),
                                                        );
                                                      },
                                                      onNoPressed: () {},
                                                    ),
                                                    barrierDismissible: true);
                                              },
                                              child: Image.asset(
                                                "assets/graphics/ic_delete_icon_green.png",
                                                width: size.width * .14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            );
                          },
                          itemCount: 4,
                        ),
                      ),
                    ),
                    const Padding(
                      child: Divider(
                        color: kBlackColor30,
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    ),
                    RoundedButtonLong(
                      buttonWidth: .9,
                      text: "Add a Payment Method",
                      press: () => {Get.to(() => AddPaymentMethodPage())},
                      imgName: 'assets/graphics/images/ic_add_white_icon.svg',
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      onPrimaryColor: Colors.white54,
                      isSVG: true,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                            height: MediaQuery.of(context).viewInsets.bottom,
                          ),
                  ],
                ),
              ),
              padding: const EdgeInsets.all(20),
            ),
          ),
        ],
      ),
    );
  }
}
