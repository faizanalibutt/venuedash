import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venuedash2/routers/review_address_payment_page.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/widgets/rounded_button_long.dart';

class AddToCartPage extends StatelessWidget {
  const AddToCartPage({Key? key}) : super(key: key);

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
            Text("My Cart",
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
                width: size.width * .95,
                color: Colors.white,
                child: Text("Items Selected",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      color: kBlackHeadingColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              const SizedBox(height: 10),
              Column(
                children: [
                  MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    removeBottom: true,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, position) {
                        return Column(children: [
                          Container(
                            height: 55,
                            padding: const EdgeInsets.only(left: 10, top: 8, bottom: 8, right: 5),
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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Velit Facere",
                                              style: GoogleFonts.lato(
                                                textStyle: const TextStyle(color: kBlackHeadingColor, fontSize: 12, fontWeight: FontWeight.bold),
                                              )),
                                          const SizedBox(height: 5),
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
                                  child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                                    InkWell(onTap: () => {Get.back()}, child: Image.asset("assets/graphics/ic_delete_icon_green.png")),
                                    SizedBox(
                                      height: 40,
                                      child: Text("1",
                                          style: GoogleFonts.lato(
                                            textStyle: const TextStyle(
                                              color: kBlackHeadingColor,
                                              fontSize: 26,
                                            ),
                                          )),
                                    ),
                                    Image.asset("assets/graphics/ic_add_circle_green_icon.png"),
                                  ]),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 10)
                        ]);
                      },
                      itemCount: 2,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      const Divider(height: 1, color: kBlackColor30),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Total Amount",
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(color: kBlackHeadingColor, fontSize: 14, fontWeight: FontWeight.bold),
                                      )),
                                  Text("Delivery Charges",
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                          color: kBlackHeadingColor,
                                          fontSize: 14,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text("\$33.57",
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(color: kBlackHeadingColor, fontSize: 14, fontWeight: FontWeight.bold),
                                      )),
                                  Text("\$5.00",
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(
                                          color: kBlackHeadingColor,
                                          fontSize: 14,
                                        ),
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                        color: kBlackColor30,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text("Payable Amount",
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(color: kBlackHeadingColor, fontSize: 14, fontWeight: FontWeight.bold),
                              )),
                        ),
                        Expanded(
                          flex: 6,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Text("\$38.57",
                                style: GoogleFonts.lato(
                                  textStyle: const TextStyle(color: kBlackHeadingColor, fontSize: 14, fontWeight: FontWeight.bold),
                                )),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Padding(
                    child: Divider(
                      height: 1,
                      color: kBlackColor30,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 50),
                  ),

                ],
              ),
              const SizedBox(height: 20),
              RoundedButtonLong(
                text: "Review Address & Payment",
                press: () => {Get.to(() => ReviewAddressPaymentPage())},
                buttonWidth: .9,
                textColor: Colors.white,
                imgName: "assets/graphics/ic_next_circle_white_icon.png",
                onPrimaryColor: Colors.white54,
                borderRadius: 16.0,
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }
}
