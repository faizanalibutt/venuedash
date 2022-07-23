import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venuedash2/controller/text_controller.dart';
import 'package:venuedash2/routers/location_confirm_page.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/widgets/rounded_button_long.dart';
import 'package:venuedash2/widgets/rounded_location_input_field.dart';

class LocationSetUpPage extends StatelessWidget {
  LocationSetUpPage({Key? key}) : super(key: key);
  final locationController = Get.put(TextController());

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          SizedBox(
            height: size.height * .035,
          ),
          Container(
              height: size.height * .05,
              alignment: Alignment.center,
              child: FittedBox(
                child: Text(
                  "Set your Location",
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(color: kBlackHeadingColor, fontSize: 24),
                  ),
                ),
              )),
          Container(
            height: size.height * .05,
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: AutoSizeText(
              "Explore venues and shops near you by using your current "
              "location or searching a location manually.",
              style: GoogleFonts.lato(
                textStyle: const TextStyle(color: kBlackSubHeadingColor, fontSize: 12),
              ),
              minFontSize: 8,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: size.height * .05,
          ),
          SizedBox(
            height: size.height * .8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SvgPicture.asset("assets/graphics/images/location_set_up_img.svg"),
                  SizedBox(
                    height: size.height * .05,
                  ),
                  RoundedLocationInputField(
                    textInputType: TextInputType.text,
                    onChanged: (value) {},
                    focus: false,
                    color: Colors.grey,
                    textColor: kBlackFieldColor,
                    cursorColor: Colors.black,
                    hintText: "Search Manually...",
                    textController: locationController.textController,
                    fieldIconCallback: () =>
                        Get.to(const LocationConfirmPage(), transition: Transition.native, duration: const Duration(milliseconds: 500)),
                  ),
                  Row(
                    children: [
                      Container(
                          height: 80.0,
                          width: size.width * .2,
                          alignment: Alignment.center,
                          child: const Divider(
                            color: Colors.transparent,
                            height: 1,
                          )),
                      Container(
                          height: 80.0,
                          width: size.width * .25,
                          padding: const EdgeInsets.only(right: 5),
                          alignment: Alignment.center,
                          child: const Divider(
                            color: kBlackColor30,
                            height: 1,
                          )),
                      Text("OR",
                          style: GoogleFonts.lato(
                            textStyle: const TextStyle(color: kBlackColor30),
                          )),
                      Container(
                          height: 80.0,
                          width: size.width * .25,
                          padding: const EdgeInsets.only(left: 5),
                          alignment: Alignment.center,
                          child: const Divider(
                            color: kBlackColor30,
                            height: 1,
                          )),
                      Container(
                          height: 80.0,
                          width: size.width * .2,
                          alignment: Alignment.center,
                          child: const Divider(
                            color: Colors.transparent,
                            height: 1,
                          )),
                    ],
                  ),
                  RoundedButtonLong(
                    text: "Use My Current Location",
                    press: () =>
                        Get.to(() => const LocationConfirmPage(), transition: Transition.native, duration: const Duration(milliseconds: 500)),
                    imgName: 'assets/graphics/ic_location_gps_icon.png',
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    onPrimaryColor: Colors.white54,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
