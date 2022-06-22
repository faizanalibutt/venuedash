import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:venuedash2/controller/text_controller.dart';
import 'package:venuedash2/routers/add_to_cart_page.dart';
import 'package:venuedash2/routers/feedback_page.dart';
import 'package:venuedash2/routers/help_page.dart';
import 'package:venuedash2/routers/location_edit_page.dart';
import 'package:venuedash2/routers/login_page.dart';
import 'package:venuedash2/routers/order_history_page.dart';
import 'package:venuedash2/routers/payment_page.dart';
import 'package:venuedash2/routers/privacy_policy_page.dart';
import 'package:venuedash2/routers/profile_edit_page.dart';
import 'package:venuedash2/routers/settings_page.dart';
import 'package:venuedash2/routers/subscription_page.dart';
import 'package:venuedash2/routers/venue_category_page.dart';
import 'package:venuedash2/routers/venue_menu_detail_page.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venuedash2/widgets/custom_action_dialog.dart';
import 'package:venuedash2/widgets/rounded_location_input_field.dart';

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
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home", style: GoogleFonts.lato(textStyle: const TextStyle(color: kBlackHeadingColor, fontSize: 16, fontWeight: FontWeight.bold))),
            const Text("", style: TextStyle(fontSize: 8))
          ],
        ),
        leading: InkWell(
          onTap: () => widget._key.currentState!.openDrawer(),
          child: Image.asset(
            "assets/graphics/ic_home_drawer_button.png",
          ),
        ),
        leadingWidth: 70,
        titleSpacing: 10,
        shadowColor: Colors.transparent,
        actions: [
          InkWell(
            onTap: () {},
            child: Image.asset(
              "assets/graphics/ic_notification_icon.png",
            ),
          ),
          InkWell(
            onTap: () => Get.to(() => const AddToCartPage()),
            child: Image.asset(
              "assets/graphics/ic_add_to_cart_icon.png",
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            width: size.width * .9,
            color: Colors.white,
            child: Text("Selected Location",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  color: kBlackHeadingColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ))),
          ),
          const SizedBox(height: 10),
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
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: SvgPicture.asset("assets/graphics/images/ic_home_location_mark.svg"),
                        ),
                        Obx(
                          () => Flexible(
                              child: Text(widget.textControllerGet.controllerTextValue.value,
                                  style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                          color: kBlackHeadingColor, fontSize: 15, fontWeight: FontWeight.normal, overflow: TextOverflow.ellipsis)))),
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
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 30,
            ),
            child: Divider(
              height: .5,
              color: kBlackColor30,
            ),
          ),
          Text(
            "323 venues found in your location",
            style: GoogleFonts.lato(
              textStyle: const TextStyle(
                color: kBlackSubHeadingColor,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 25),
          RoundedLocationInputField(
            fieldWidth: .9,
            textInputType: TextInputType.text,
            onChanged: (value) {},
            focus: false,
            color: Colors.grey,
            textColor: kBlackFieldColor,
            cursorColor: Colors.black,
            hintText: "Search...",
            fieldIconCallback: () {},
          ),
          const SizedBox(height: 25),
          Container(
            width: size.width * .9,
            color: Colors.white,
            child: Text("Venue Categories",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  color: kBlackHeadingColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ))),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 80,
            width: size.width * .9,
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              removeBottom: true,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, position) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Ink(
                          width: 80,
                          height: 80,
                          padding: EdgeInsets.zero,
                          decoration: const BoxDecoration(
                            color: kLoationFiedlBgColor,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: InkWell(
                              onTap: () => Get.to(() => const VenueCategoryPage()),
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              child: SizedBox(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Flexible(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      child: Image.asset(
                                        "assets/graphics/venue_category_icon_2.png",
                                      ),
                                    ),
                                  ),
                                  Flexible(
                                      flex: 2,
                                      child: Padding(
                                          padding: EdgeInsets.zero,
                                          child: Text("Super Mart",
                                              style: GoogleFonts.lato(
                                                textStyle:
                                                    const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                              )))),
                                ],
                              )))),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  );
                },
                itemCount: 5,
              ),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            width: size.width * .9,
            color: Colors.white,
            child: Text("Popular Venues",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  color: kBlackHeadingColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ))),
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 220,
              width: size.width * .9,
              child: MediaQuery.removePadding(
                context: context,
                removeBottom: true,
                removeTop: true,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, position) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () => Get.to(() => const VenueMenuDetailPage()),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          child: Ink(
                              width: 200,
                              height: 200,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: kLoationFiedlBgColor,
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 130,
                                    width: 190,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset("assets/graphics/Rectangle 583.png"),
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text("Venue Dash Business",
                                      textAlign: TextAlign.start,
                                      style: GoogleFonts.lato(
                                          textStyle: const TextStyle(
                                        color: kBlackHeadingColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ))),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Row(children: [
                                    SizedBox(
                                      height: 25,
                                      //color: Colors.yellow,
                                      width: 90,
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Row(
                                          children: [
                                            Image.asset("assets/graphics/ic_rating_star_yellow_icon.png"),
                                            const SizedBox(width: 5),
                                            Text(
                                              "3.1 Rating",
                                              style: GoogleFonts.lato(
                                                textStyle:
                                                    const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        Row(
                                          children: [
                                            Image.asset("assets/graphics/ic_distance_green_icon.png"),
                                            const SizedBox(width: 5),
                                            Text(
                                              "17.2 km away.",
                                              style: GoogleFonts.lato(
                                                textStyle:
                                                    const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                              ),
                                            ),
                                          ],
                                        )
                                      ]),
                                    ),
                                    SizedBox(
                                      height: 25,
                                      width: 90,
                                      child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                        Text(
                                          "864 Reviews",
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 1,
                                        ),
                                        Text(
                                          "Deliver in 5 minutes",
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ])
                                ],
                              )),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    );
                  },
                  itemCount: 5,
                ),
              )),
          const SizedBox(height: 5),
          Container(
            width: size.width * .9,
            color: Colors.white,
            child: Text("New Venues",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  color: kBlackHeadingColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ))),
          ),
          const SizedBox(height: 10),
          SizedBox(
              height: 220,
              width: size.width * .9,
              child: MediaQuery.removePadding(
                context: context,
                removeBottom: true,
                removeTop: true,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, position) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Ink(
                            width: 200,
                            height: 200,
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: kLoationFiedlBgColor,
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            child: InkWell(
                                onTap: () {},
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 130,
                                      width: 190,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.asset("assets/graphics/Rectangle 583.png"),
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text("Venue Dash Business",
                                        textAlign: TextAlign.start,
                                        style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                          color: kBlackHeadingColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ))),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    Row(children: [
                                      SizedBox(
                                        height: 25,
                                        //color: Colors.yellow,
                                        width: 90,
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                          Row(
                                            children: [
                                              Image.asset("assets/graphics/ic_rating_star_yellow_icon.png"),
                                              const SizedBox(width: 5),
                                              Text(
                                                "3.1 Rating",
                                                style: GoogleFonts.lato(
                                                  textStyle:
                                                      const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 1,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset("assets/graphics/ic_distance_green_icon.png"),
                                              const SizedBox(width: 5),
                                              Text(
                                                "17.2 km away.",
                                                style: GoogleFonts.lato(
                                                  textStyle:
                                                      const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                                ),
                                              ),
                                            ],
                                          )
                                        ]),
                                      ),
                                      SizedBox(
                                        height: 25,
                                        width: 90,
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                                          Text(
                                            "864 Reviews",
                                            style: GoogleFonts.lato(
                                              textStyle: const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 1,
                                          ),
                                          Text(
                                            "Deliver in 5 minutes",
                                            style: GoogleFonts.lato(
                                              textStyle: const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ])
                                  ],
                                ))),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    );
                  },
                  itemCount: 5,
                ),
              )),
        ],
      )),
      drawer: SizedBox(
        width: size.width * .7,
        child: Drawer(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * .13,
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
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
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
                                    padding: const EdgeInsets.only(top: 8, left: 8),
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
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
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
                                    padding: const EdgeInsets.symmetric(horizontal: 8),
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
                height: size.height * .6,
                child: Padding(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                            onTap: () => {widget._key.currentState!.openEndDrawer(), Get.to(() => const SubscriptionPage())},
                            child: Padding(
                              child: Row(
                                children: [
                                  Image.asset(
                                    "assets/graphics/ic_subscription_drawer_black_icon.png",
                                  ),
                                  const SizedBox(width: 12),
                                  Text(
                                    "Subscription",
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
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                            onTap: () => {
                                  widget._key.currentState!.openEndDrawer(),
                                  Get.to(
                                    () => const OrderHistoryPage(),
                                  )
                                },
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
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                            onTap: () => {widget._key.currentState!.openEndDrawer(), Get.to(() => const PaymentPage())},
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
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        InkWell(
                            onTap: () => {widget._key.currentState!.openEndDrawer(), Get.to(() => const HelpPage())},
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
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                          decoration: const BoxDecoration(
                            color: kLoationFiedlBgColor,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          child: InkWell(
                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                              onTap: () {
                                widget._key.currentState!.openEndDrawer();
                                Get.dialog(
                                    CustomActionDialog(
                                      icon: "assets/graphics/ic_sign_out_green_icon.png",
                                      title: "Logout?",
                                      description: "Are you sure you want to logout your account?",
                                      iconVe: "assets/graphics/ic_sign_out_white_icon.png",
                                      iconNve: "assets/graphics/ic_cancel_icon.png",
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
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
