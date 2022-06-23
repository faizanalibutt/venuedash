import 'dart:async';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/widgets/outlined_border_button_long.dart';

class VenueOrderPage extends StatefulWidget {
  const VenueOrderPage({Key? key}) : super(key: key);

  @override
  State<VenueOrderPage> createState() => _VenueOrderPageState();
}

class _VenueOrderPageState extends State<VenueOrderPage> {
  static const LatLng _center = LatLng(24.852360954494383, 67.04388409769187);

  final Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  late BitmapDescriptor markerIcon;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
    setState(() {
      // adding a new marker to map
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_lastMapPosition.toString()),
        position: _lastMapPosition,
        infoWindow: const InfoWindow(
          title: 'Jinnah Medical Center',
          snippet: '5 Star Rating',
        ),
        icon: markerIcon,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(12, 12)), 'assets/graphics/ic_customer_location_icon.png').then((icon) {
      markerIcon = icon;
    });
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("My Order",
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
              Image.asset(
                "assets/graphics/img_order_collect.png",
                alignment: Alignment.center,
                width: size.width,
                height: 170,
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                width: size.width,
                child: Text(
                  "The rider is at your doorstep. Please collect your order.",
                  style: GoogleFonts.lato(
                      textStyle: const TextStyle(
                    color: kBlackHeadingColor,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  )),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Image.asset("assets/graphics/img_progress_4.png"),
              const SizedBox(height: 20),
              Ink(
                height: 70,
                width: size.width,
                decoration: const BoxDecoration(
                  color: kLoationFiedlBgColor,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Delivering In",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                        color: kBlackHeadingColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      )),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "00:09:44",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                        color: kBlackHeadingColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)), boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  )
                ]),
                width: size.width,
                height: 170,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    markers: _markers,
                    onCameraMove: _onCameraMove,
                    initialCameraPosition: const CameraPosition(target: _center, zoom: 16.0),
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
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                OutlinedBorderButtonLong(
                  text: "Back to Home",
                  press: () => Get.back(),
                  textColor: kPrimaryColor,
                  borderColor: kPrimaryColor,
                  buttonWidth: .45,
                  borderRadius: 16.0,
                  imgName: "assets/graphics/ic_back_circle_green_icon.png",
                ),
                const SizedBox(width: 5),
                OutlinedBorderButtonLong(
                  text: "Post a Review",
                  press: () => Get.back(),
                  textColor: kPrimaryColor,
                  borderColor: kPrimaryColor,
                  buttonWidth: .45,
                  borderRadius: 16.0,
                  imgName: "assets/graphics/ic_post_review_green_icon.png",
                ),
              ]),
              const SizedBox(height: 20),
              Container(
                width: size.width,
                color: Colors.white,
                child: Text("Payment Method",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      color: kBlackHeadingColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              const SizedBox(height: 10),
              Ink(
                width: size.width,
                height: 60,
                decoration: const BoxDecoration(
                  color: kLoationFiedlBgColor,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset(
                        "assets/graphics/ic_cash_payment_icon.png",
                        height: 30,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "Cash on Delivery",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(color: kBlackHeadingColor, fontSize: 14, overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: size.width,
                color: Colors.white,
                child: Text("Order Details",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      color: kBlackHeadingColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              const SizedBox(height: 10),
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
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }
}
