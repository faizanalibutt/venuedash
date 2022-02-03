import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venuedash2/routers/add_payment_method_page.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/widgets/custom_alert_confirmation_dialog.dart';
import 'package:venuedash2/widgets/rounded_button_long.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({Key? key}) : super(key: key);

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
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.yellow,
                    padding: const EdgeInsets.all(20),
                  ),
                  const Padding(
                    child: Divider(
                      color: kBlackColor30,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  ),
                  RoundedButtonLong(
                    buttonWidth: .9,
                    text: "Add a Payment Method",
                    press: () => {Get.to(() => const AddPaymentMethodPage())},
                    imgName: 'assets/graphics/ic_okay_icon.png',
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    onPrimaryColor: Colors.white54,
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
