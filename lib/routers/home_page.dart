import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:venuedash2/controller/text_controller.dart';
import 'package:venuedash2/routers/feedback_page.dart';
import 'package:venuedash2/routers/location_edit_page.dart';
import 'package:venuedash2/routers/login_page.dart';
import 'package:venuedash2/routers/payment_page.dart';
import 'package:venuedash2/routers/privacy_policy_page.dart';
import 'package:venuedash2/routers/profile_edit_page.dart';
import 'package:venuedash2/routers/settings_page.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venuedash2/widgets/custom_action_dialog.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  final locationController = Get.put(TextController());
  final textControllerGet = Get.find<TextController>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: widget._key,
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Container(
            alignment: Alignment.bottomCenter,
            height: size.height * .12,
            child: Row(children: [
              SizedBox(
                width: size.width * .02,
              ),
              SizedBox(
                width: size.width * .15,
                child: InkWell(
                  onTap: () {
                    widget._key.currentState!.openDrawer();
                  },
                  child: Image.asset(
                    "assets/graphics/ic_home_drawer_button.png",
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 10, left: 12),
                color: Colors.white,
                width: size.width * .51,
                child: Text("Home",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      color: kBlackHeadingColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              SizedBox(
                width: size.width * .15,
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/graphics/ic_notification_icon.png",
                  ),
                ),
              ),
              SizedBox(
                width: size.width * .15,
                child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    "assets/graphics/ic_add_to_cart_icon.png",
                  ),
                ),
              ),
              SizedBox(
                width: size.width * .01,
              ),
            ]),
          ),
          SizedBox(
            height: size.height * .88,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  width: size.width * .9,
                  color: Colors.white,
                  child: Text("Selected Location",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                        color: kBlackHeadingColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ))),
                ),
                const SizedBox(
                  height: 20,
                ),
                Ink(
                  width: size.width * .9,
                  decoration: const BoxDecoration(
                    color: kLoationFiedlBgColor,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    onTap: () {
                      Get.to(() => const LocationEditPage());
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: SvgPicture.asset(
                                    "assets/graphics/images/ic_home_location_mark.svg"),
                              ),
                              Obx(
                                () => Flexible(
                                    child: Text(
                                        widget.textControllerGet
                                            .controllerTextValue.value,
                                        style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                                color: kBlackHeadingColor,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                                overflow:
                                                    TextOverflow.ellipsis)))),
                              ),
                            ],
                          ),
                          width: size.width * .75,
                        ),
                        SizedBox(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Image.asset(
                            "assets/graphics/ic_edit_location_home_icon.png",
                            width: size.width * .15,
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            )),
          )
        ]),
        drawer: SizedBox(
          width: size.width * .7,
          child: Drawer(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * .12,
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        widget._key.currentState!.openEndDrawer();
                      },
                      child: Image.asset(
                        "assets/graphics/ic_close_icon.png",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 20),
                  child: Ink(
                    decoration: const BoxDecoration(
                      color: kLoationFiedlBgColor,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    height: size.height * .2,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      onTap: () {
                        widget._key.currentState!.openEndDrawer();
                        Get.to(() => const ProfileEditPage());
                      },
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.topRight,
                            padding: const EdgeInsets.only(right: 4, top: 4),
                            child: Image.asset(
                              "assets/graphics/ic_edit_icon.png",
                            ),
                          ),
                          // do remember link in decoration when actual image is added by user.
                          Positioned(
                              bottom: 0,
                              child: Padding(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      child: Image.asset(
                                        "assets/graphics/ic_profile_icon.png",
                                      ),
                                      padding: const EdgeInsets.only(
                                          top: 8, left: 8),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      child: Text(
                                        "Melvin Harris",
                                        style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                          color: kBlackHeadingColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        )),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                    ),
                                    Padding(
                                      child: Text(
                                        "malvinharris91@gmail.com",
                                        style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                          color: kBlackFieldColor,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w300,
                                        )),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.only(bottom: 10),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Divider(
                    color: kBlackColor30,
                    height: 1.0,
                  ),
                ),
                SizedBox(
                  height: size.height * .63,
                  child: Padding(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () =>
                                  widget._key.currentState!.openEndDrawer(),
                              child: Padding(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/graphics/ic_home_black_icon.png",
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      "Home",
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                        color: kBlackHeadingColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                              onTap: () =>
                                  widget._key.currentState!.openEndDrawer(),
                              child: Padding(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/graphics/ic_order_history_black_icon.png",
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      "Orders History",
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                        color: kBlackHeadingColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                              onTap: () => {
                                    widget._key.currentState!.openEndDrawer(),
                                    Get.to(() => const PaymentPage())
                                  },
                              child: Padding(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/graphics/ic_payment_black_icon.png",
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      "Payment Methods",
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                        color: kBlackHeadingColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                              onTap: () =>
                                  widget._key.currentState!.openEndDrawer(),
                              child: Padding(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/graphics/ic_help_black_icon.png",
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      "Need Help?",
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                        color: kBlackHeadingColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                              onTap: () {
                                widget._key.currentState!.openEndDrawer();
                                Get.to(() => const FeedbackPage());
                              },
                              child: Padding(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/graphics/ic_feedback_black_icon.png",
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      "Give us Feedback",
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                        color: kBlackHeadingColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                              onTap: () {
                                widget._key.currentState!.openEndDrawer();
                                Get.to(() => const PrivacyPolicyPage());
                              },
                              child: Padding(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/graphics/ic_terms_black_icon.png",
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      "Terms & Conditions",
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                        color: kBlackHeadingColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              )),
                          const SizedBox(
                            height: 5,
                          ),
                          InkWell(
                              onTap: () {
                                widget._key.currentState!.openEndDrawer();
                                Get.to(() => const SettingsPage());
                              },
                              child: Padding(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/graphics/ic_setting_black_icon.png",
                                    ),
                                    const SizedBox(
                                      width: 12,
                                    ),
                                    Text(
                                      "Settings",
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                        color: kBlackHeadingColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      )),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                              )),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(
                            color: kBlackColor30,
                            height: 1.0,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Ink(
                            color: kLoationFiedlBgColor,
                            child: InkWell(
                                onTap: () {
                                  widget._key.currentState!.openEndDrawer();
                                  Get.dialog(
                                      CustomActionDialog(
                                        icon: "assets/graphics/ic_sign_out_green_icon.png",
                                        title: "Logout?",
                                        description:
                                            "Are you sure you want to logout your account?",
                                        iconVe:
                                            "assets/graphics/ic_sign_out_white_icon.png",
                                        iconNve:
                                            "assets/graphics/ic_cancel_icon.png",
                                        titleBtnYes: "Logout",
                                        titleBtnNo: "No",
                                        onYesPressed: () {
                                          Get.back();
                                          Get.to(() => const LoginPage());
                                        },
                                        onNoPressed: () {},
                                      ),
                                      barrierDismissible: true);
                                },
                                child: Padding(
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        "assets/graphics/ic_logout_black_icon.png",
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        "Logout",
                                        style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                          color: kBlackHeadingColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        )),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                )),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).viewInsets.bottom,
                          ),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
