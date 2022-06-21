import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venuedash2/routers/venue_details_page.dart';
import 'package:venuedash2/utils/constants.dart';

class VenueMenuDetailPage extends StatelessWidget {
  const VenueMenuDetailPage({Key? key}) : super(key: key);

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
            Text("Venue Menu",
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
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => const VenueDetailsPage());
            },
            child: Image.asset(
              "assets/graphics/ic_info_green_icon.png",
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Padding(
        child: SingleChildScrollView(
          child: Column(children: [
            Stack(
                children: [
                  Image.asset(
                    "assets/graphics/img_business_profile_cover.png",
                    width: size.width,
                    height: 300,
                    alignment: Alignment.topCenter,
                  ),
                  Container(
                    height: 290,
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 90,
                      width: size.width * .9,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Volup Tas UT Shop",
                                    style: GoogleFonts.lato(
                                      textStyle: const TextStyle(
                                        color: kBlackHeadingColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Row(children: [
                                    Image.asset("assets/graphics/ic_rating_star_yellow_icon.png", height: 12),
                                    const SizedBox(width: 5),
                                    Text("5 Rating",
                                        style: GoogleFonts.lato(
                                          textStyle: const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                        )),
                                    Expanded(
                                        child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("223 Reviews",
                                          style: GoogleFonts.lato(
                                              textStyle:
                                                  const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis))),
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
                                          textStyle: const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                        )),
                                    Expanded(
                                        child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text("Delivers in 6 minutes",
                                          style: GoogleFonts.lato(
                                              textStyle:
                                                  const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis))),
                                    ))
                                  ])
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      decoration: const BoxDecoration(
                        color: kLoationFiedlBgColor,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(
                height: 35,
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
                              width: 100,
                              padding: EdgeInsets.zero,
                              decoration: const BoxDecoration(
                                color: kLoationFiedlBgColor,
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              ),
                              child: InkWell(
                                  onTap: () {},
                                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                                  child: SizedBox(
                                      child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text("Super Mart".toUpperCase(),
                                            style: GoogleFonts.lato(
                                              textStyle: const TextStyle(
                                                  color: kBlackSubHeadingColor,
                                                  fontSize: 10,
                                                  overflow: TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
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
                child: Text("Popular Items",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      color: kBlackHeadingColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * .9,
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, position) {
                        return Column(
                          children: [
                            Container(
                              height: 80,
                              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                              decoration: const BoxDecoration(
                                color: kLoationFiedlBgColor,
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Image.asset("assets/graphics/img_product_item.png"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Velit Facere",
                                                style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                    color: kBlackHeadingColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "3 items",
                                              style: GoogleFonts.lato(
                                                textStyle:
                                                    const TextStyle(color: kBlackSubHeadingColor, fontSize: 12, overflow: TextOverflow.ellipsis),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text("\$9.0",
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                    color: kBlackHeadingColor,
                                                    fontSize: 12,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                            onTap: () => Get.back(),//to(() => const EditProductPage()),
                                            child: Image.asset("assets/graphics/ic_add_circle_green_icon.png"))),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 8)
                          ],
                        );
                      },
                      itemCount: 3,
                    )),
              ),
              const SizedBox(height: 25),
              Container(
                width: size.width * .9,
                color: Colors.white,
                child: Text("Baked Items",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      color: kBlackHeadingColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * .9,
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, position) {
                        return Column(
                          children: [
                            Container(
                              height: 80,
                              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                              decoration: const BoxDecoration(
                                color: kLoationFiedlBgColor,
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Image.asset("assets/graphics/img_product_item.png"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Velit Facere",
                                                style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                    color: kBlackHeadingColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "3 items",
                                              style: GoogleFonts.lato(
                                                textStyle:
                                                    const TextStyle(color: kBlackSubHeadingColor, fontSize: 12, overflow: TextOverflow.ellipsis),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text("\$9.0",
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                    color: kBlackHeadingColor,
                                                    fontSize: 12,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                            onTap: () => Get.back(),//to(() => const EditProductPage()),
                                            child: Image.asset("assets/graphics/ic_add_circle_green_icon.png"))),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 8)
                          ],
                        );
                      },
                      itemCount: 3,
                    )),
              ),
              const SizedBox(height: 25),
              Container(
                width: size.width * .9,
                color: Colors.white,
                child: Text("Dairy Products",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      color: kBlackHeadingColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width * .9,
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, position) {
                        return Column(
                          children: [
                            Container(
                              height: 80,
                              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                              decoration: const BoxDecoration(
                                color: kLoationFiedlBgColor,
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Row(
                                      children: [
                                        Image.asset("assets/graphics/img_product_item.png"),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text("Velit Facere",
                                                style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                    color: kBlackHeadingColor,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                )),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "3 items",
                                              style: GoogleFonts.lato(
                                                textStyle:
                                                    const TextStyle(color: kBlackSubHeadingColor, fontSize: 12, overflow: TextOverflow.ellipsis),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Text("\$9.0",
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                    color: kBlackHeadingColor,
                                                    fontSize: 12,
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Align(
                                        alignment: Alignment.centerRight,
                                        child: InkWell(
                                            onTap: () => Get.back(),//to(() => const EditProductPage()),
                                            child: Image.asset("assets/graphics/ic_add_circle_green_icon.png"))),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(height: 8)
                          ],
                        );
                      },
                      itemCount: 3,
                    )),
              ),
              const SizedBox(height: 25),
          ],),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }
}
