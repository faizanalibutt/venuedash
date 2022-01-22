import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/parser.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:venuedash2/controller/TextController.dart';
import 'package:venuedash2/routers/home_page.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/widgets/confirmation_dialog_2.dart';
import 'package:venuedash2/widgets/custom_alert_dialog.dart';
import 'package:venuedash2/widgets/rounded_button_long.dart';
import 'package:venuedash2/widgets/rounded_location_input_field.dart';

class LocationConfirmPage extends StatefulWidget {
  const LocationConfirmPage({Key? key}) : super(key: key);

  @override
  _LocationConfirmPageState createState() => _LocationConfirmPageState();
}

class _LocationConfirmPageState extends State<LocationConfirmPage> {
  final textController = Get.find<TextController>();
  final Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = LatLng(45.521563, -122.677433);
  final Set<Marker> _markers = {};
  LatLng _lastMapPosition = _center;
  late BitmapDescriptor markerIcon;

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(12, 12)),
            'assets/graphics/ic_location_mark_icon.png')
        .then((icon) {
      markerIcon = icon;
    });
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: size.height * .05,
          ),
          Container(
              height: size.height * .05,
              alignment: Alignment.center,
              child: const FittedBox(
                child: Text("Confirm Location",
                    style: TextStyle(color: kBlackHeadingColor, fontSize: 24)),
              )),
          Container(
            height: size.height * .05,
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: const AutoSizeText(
              "Please confirm your location or change it.",
              style: TextStyle(color: kBlackSubHeadingColor, fontSize: 12),
              minFontSize: 8,
              maxLines: 2,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: size.height * .85,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: size.width * .9,
                    child: Row(
                      children: [
                        RoundedLocationInputField(
                          fieldWidth: .75,
                          textInputType: TextInputType.text,
                          onChanged: (value) {},
                          focus: false,
                          color: Colors.grey,
                          textColor: kBlackFieldColor,
                          cursorColor: Colors.black,
                          hintText: "Search Manually...",
                          textController: textController.textController,
                          fieldIconCallback: () {
                            setState(() {
                              _markers.clear();
                              _markers.add(Marker(
                                // This marker id can be anything that uniquely identifies each marker.
                                markerId: MarkerId(_lastMapPosition.toString()),
                                position: _lastMapPosition,
                                infoWindow: const InfoWindow(
                                  title: 'Really cool place',
                                  snippet: '5 Star Rating',
                                ),
                                icon: markerIcon,
                              ));
                            });
                          },
                        ),
                        SizedBox(
                          child: InkWell(
                              onTap: () async {
                                enableUserLocation();
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.only(top: 3, right: 0),
                                child: Image.asset(
                                  "assets/graphics/ic_current_location_icon.png",
                                ),
                              )),
                          width: size.width * .15,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 4,
                            blurRadius: 14,
                            offset: Offset(0, 3),
                          )
                        ]),
                    height: size.height * .5,
                    width: size.width * .9,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        markers: _markers,
                        onCameraMove: _onCameraMove,
                        initialCameraPosition: const CameraPosition(
                          target: _center,
                          zoom: 11.0,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  RoundedButtonLong(
                    buttonWidth: .9,
                    text: "Confirm",
                    press: () => Get.to(const HomePage(),
                        transition: Transition.native,
                        duration: const Duration(milliseconds: 500)),
                    imgName: 'assets/graphics/ic_confirm_location_icon.png',
                    color: kPrimaryColor,
                    textColor: Colors.white,
                    onPrimaryColor: Colors.white54,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ],
              ),
            ),
          )
        ]));
  }

  void svgParser() {
    final SvgParser parser = SvgParser();
    try {
      parser.parse("assets/graphics/ic_current_location_icon.svg",
          warningsAsErrors: false);
      if (kDebugMode) print('SVG is supported');
    } catch (e) {
      if (kDebugMode) print('SVG contains unsupported features');
    }
  }

  void _checkPermission(Function callback) async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        _serviceEnabled = false;
      }
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        _serviceEnabled = false;
      }
    }
    _serviceEnabled = true;
    if (!_serviceEnabled ||
        _permissionGranted == PermissionStatus.denied ||
        _permissionGranted == PermissionStatus.grantedLimited) {
      Get.dialog(
          CustomAlertDialog(
              description: "You denied location permission or allowed for "
                  "foreground use only. You need to allow permission for all time to use this service.",
              onOkPressed: () async {
                Get.back();
                await location.requestPermission();
              }),
          barrierDismissible: false);
    } else if (_permissionGranted == PermissionStatus.deniedForever) {
      Get.dialog(
          CustomAlertDialog(
              description: "You denied location permission for forever. You "
                  "need to allow permission to use this service.",
              onOkPressed: () async {
                Get.back();
                await Geolocator.openAppSettings();
              }),
          barrierDismissible: false);
    } else {
      callback();
    }
  }

  void enableUserLocation() async {
    PermissionStatus _permissionGranted;
    Location location = Location();
    bool _serviceEnabled;

    _permissionGranted = await location.hasPermission();
    _serviceEnabled = await location.serviceEnabled();

    if (_permissionGranted == PermissionStatus.denied ||
        _permissionGranted == PermissionStatus.deniedForever ||
        _permissionGranted == PermissionStatus.grantedLimited) {
      Get.dialog(
          ConfirmationDialog2(
            icon: "assets/graphics/ic_current_location_icon.png",
            iconSize: 200,
            description:
                "This app collects location data to enable location fetching at the time of your online status, even when the app is closed or not in use.",
            onYesPressed: () {
              Get.back();
              _checkPermission(() {});
            },
            onNoPressed: () {
              print("getProfile Called");
              Get.dialog(
                  CustomAlertDialog(
                      description:
                          "You denied location permission for forever. You need to allow permission to use this service.",
                      onOkPressed: () async {
                        Get.back();
                        await Geolocator.openAppSettings();
                      }),
                  barrierDismissible: false);
            },
          ),
          barrierDismissible: false);
    } else if (!_serviceEnabled) {
      Get.dialog(
          ConfirmationDialog2(
            icon: "assets/graphics/ic_current_location_icon.png",
            iconSize: 200,
            description:
                "This app collects location data to enable location fetching at the time of your online status, even when the app is closed or not in use.",
            onYesPressed: () {
              Get.back();
              _checkPermission(() => {});
            },
            onNoPressed: () {
              print("getProfile Called");
              Get.dialog(
                  CustomAlertDialog(
                      description:
                          "You denied location permission for forever. You need to allow permission to use this service.",
                      onOkPressed: () async {
                        Get.back();
                        await Geolocator.openAppSettings();
                      }),
                  barrierDismissible: false);
            },
          ),
          barrierDismissible: false);
    } else {
      // nothing here will add later
    }
  }
}
