import 'dart:async';

import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venuedash2/controller/text_controller.dart';
import 'package:venuedash2/routers/add_payment_method_page.dart';
import 'package:venuedash2/routers/location_edit_page.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/widgets/outlined_border_button_long.dart';
import 'package:venuedash2/widgets/rounded_button_long.dart';

class ReviewAddressPaymentPage extends StatefulWidget {
  ReviewAddressPaymentPage({Key? key}) : super(key: key);

  final textControllerGet = Get.find<TextController>();

  @override
  State<ReviewAddressPaymentPage> createState() => _ReviewAddressPaymentPageState();
}

class _ReviewAddressPaymentPageState extends State<ReviewAddressPaymentPage> {
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

  int _groupValue = -1;

  Widget _myRadioButton({String title = "", int value = 0, required Function(int?) onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RadioListTile(
        value: value,
        groupValue: _groupValue,
        onChanged: onChanged,
        contentPadding: EdgeInsets.zero,
        title: Row(
          children: [
            Image.asset(
              "assets/graphics/ic_cash_payment_icon.png",
              height: 30,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: GoogleFonts.lato(
                textStyle: const TextStyle(color: kBlackHeadingColor, fontSize: 14, overflow: TextOverflow.ellipsis),
              ),
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
        activeColor: kBlackHeadingColor,
      ),
    );
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
            Text("Review Address & Payment",
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
              SizedBox(
                width: size.width,
                child: Text("Deliver to Address",
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
                height: 60,
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
                                              color: kBlackHeadingColor,
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              overflow: TextOverflow.ellipsis)))),
                            ),
                          ],
                        ),
                        width: size.width * .75,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Image.asset("assets/graphics/ic_edit_location_home_icon.png"),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(16)), boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  )
                ]),
                width: size.width * .9,
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
              Container(
                width: size.width * .9,
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
                width: size.width * .9,
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
                    InkWell(
                      onTap: () => {
                        showModalBottomSheet(
                          context: context,
                          elevation: 50,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(36.0), topRight: Radius.circular(36.0)),
                          ),
                          builder: (BuildContext context) {
                            return StatefulBuilder(
                              builder: (BuildContext context, StateSetter stateSetter) {
                                return Material(
                                  color: Colors.white,
                                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(36), topRight: Radius.circular(36)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Image.asset("assets/graphics/ic_payment_bar_grey_icon.png"),
                                          const SizedBox(height: 20),
                                          Container(
                                            width: size.width * .9,
                                            color: Colors.white,
                                            child: Text("Payment Methods",
                                                style: GoogleFonts.lato(
                                                    textStyle: const TextStyle(
                                                  color: kBlackHeadingColor,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                          ),
                                          _myRadioButton(
                                            title: "Paypal-3492",
                                            value: 0,
                                            onChanged: (newValue) => stateSetter(() => _groupValue = newValue!),
                                          ),
                                          _myRadioButton(
                                            title: "Paypal-2223",
                                            value: 1,
                                            onChanged: (newValue) => stateSetter(() => _groupValue = newValue!),
                                          ),
                                          _myRadioButton(
                                            title: "Paypal-2223",
                                            value: 2,
                                            onChanged: (newValue) => stateSetter(() => _groupValue = newValue!),
                                          ),
                                          const SizedBox(height: 20),
                                          OutlinedBorderButtonLong(
                                            text: "Add a Payment Method",
                                            press: () => {Get.back(), Get.to(() => AddPaymentMethodPage())},
                                            textColor: kPrimaryColor,
                                            borderColor: kPrimaryColor,
                                            borderRadius: 16.0,
                                            buttonWidth: .9,
                                            imgName: "assets/graphics/ic_add_green_icon.png",
                                          ),
                                          const Padding(
                                            child: Divider(
                                              height: 1,
                                              color: kBlackColor30,
                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                                          ),
                                          RoundedButtonLong(
                                            text: "Confirm Payment Method",
                                            press: () => Get.back(),
                                            textColor: Colors.white,
                                            imgName: "assets/graphics/ic_okay_icon.png",
                                            onPrimaryColor: Colors.white54,
                                            borderRadius: 16.0,
                                            buttonWidth: .9,
                                          ),
                                          const SizedBox(height: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        )
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Image.asset(
                          "assets/graphics/ic_edit_icon.png",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                child: Divider(
                  height: 1,
                  color: kBlackColor30,
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              RoundedButtonLong(
                text: "Place Order",
                press: () => {
                  Get.back(),
                },
                buttonWidth: .9,
                textColor: Colors.white,
                imgName: "assets/graphics/ic_okay_icon.png",
                onPrimaryColor: Colors.white54,
                borderRadius: 16.0,
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
