import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venuedash2/routers/venue_menu_detail_page.dart';
import 'package:venuedash2/utils/constants.dart';

class VenueCategoryPage extends StatelessWidget {
  const VenueCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Venue Category",
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                  color: kBlackHeadingColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ))),
            const Text("", style: TextStyle(fontSize: 8))
          ],
        ),
        leading: InkWell(
          onTap: () => Get.back(),
          child: Image.asset(
            "assets/graphics/ic_back_button.png",
          ),
        ),
        leadingWidth: 80,
        shadowColor: Colors.transparent,
      ),
      body: Padding(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width * .9,
                color: Colors.white,
                alignment: Alignment.center,
                child: Text("6 venues found",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      color: kBlackSubHeadingColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              const SizedBox(height: 30),
              MediaQuery.removePadding(
                  context: context,
                  removeTop: true,
                  removeBottom: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, position) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Ink(
                            width: size.width * .9,
                            height: 260,
                            padding: EdgeInsets.zero,
                            decoration: const BoxDecoration(
                              color: kLoationFiedlBgColor,
                              borderRadius: BorderRadius.all(Radius.circular(16)),
                            ),
                            child: InkWell(
                                borderRadius: const BorderRadius.all(Radius.circular(16)),
                                onTap: () => Get.to(() => const VenueMenuDetailPage()), //to(() => const OrderDeliveryPage()),
                                child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                                      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                        Expanded(
                                            child: Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                              Image.asset(
                                                "assets/graphics/img_venue_business.png",
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                "Voluptas Ut Aut Shop",
                                                style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                      color: kBlackHeadingColor,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.bold,
                                                      overflow: TextOverflow.ellipsis),
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              Column(children: [
                                                Row(children: [
                                                  Image.asset("assets/graphics/ic_rating_star_yellow_icon.png", height: 12),
                                                  const SizedBox(width: 5),
                                                  Text("5 Rating",
                                                      style: GoogleFonts.lato(
                                                        textStyle: const TextStyle(
                                                            color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                                      )),
                                                  Expanded(
                                                      child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Text("223 Reviews",
                                                        style: GoogleFonts.lato(
                                                            textStyle: const TextStyle(
                                                                color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis))),
                                                  )),
                                                ]),
                                                const SizedBox(height: 4),
                                                Row(children: [
                                                  Image.asset(
                                                    "assets/graphics/ic_distance_green_icon.png",
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text("1203 km away.",
                                                      style: GoogleFonts.lato(
                                                        textStyle: const TextStyle(
                                                            color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                                      )),
                                                  Expanded(
                                                      child: Align(
                                                    alignment: Alignment.centerRight,
                                                    child: Text("Delivers in 6 minutes",
                                                        style: GoogleFonts.lato(
                                                            textStyle: const TextStyle(
                                                                color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis))),
                                                  ))
                                                ])
                                              ])
                                            ]))
                                      ])
                                    ]))),
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                    itemCount: 6,
                  )),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }
}
