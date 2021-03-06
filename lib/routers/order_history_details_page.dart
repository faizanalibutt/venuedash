import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venuedash2/routers/add_to_cart_page.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/widgets/rounded_button_long.dart';

class OrderHistoryDetailsPage extends StatelessWidget {
  const OrderHistoryDetailsPage({Key? key}) : super(key: key);

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
            Text("Order Details",
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
              Ink(
                width: size.width,
                decoration: const BoxDecoration(
                  color: kLoationFiedlBgColor,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Material(
                          color: kLoationFiedlBgColor,
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
                                      Row(
                                        children: [
                                          Flexible(
                                            child: Row(
                                              children: [
                                                Image.asset("assets/graphics/BG-1.png"),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Eligendi Ad",
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
                                                    Text("x1",
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
                                              child: Text("\$14.45",
                                                  style: GoogleFonts.lato(
                                                    textStyle: const TextStyle(
                                                      color: kBlackHeadingColor,
                                                      fontSize: 14,
                                                    ),
                                                  )),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 8)
                                    ],
                                  );
                                },
                                itemCount: 4,
                              ))),
                      Column(
                        children: [
                          const Divider(height: 1, color: kBlackColor30),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
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
                      const SizedBox(height: 10),
                      Row(
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
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              RoundedButtonLong(
                text: "Reorder",
                press: () => Get.to(const AddToCartPage()),
                textColor: Colors.white,
                imgName: "assets/graphics/ic_okay_icon.png",
                onPrimaryColor: Colors.white54,
                borderRadius: 16.0,
                buttonWidth: .9,
              ),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }
}
