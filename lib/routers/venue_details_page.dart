import 'dart:async';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:venuedash2/utils/constants.dart';

class VenueDetailsPage extends StatefulWidget {
  const VenueDetailsPage({Key? key}) : super(key: key);

  @override
  State<VenueDetailsPage> createState() => _VenueDetailsPageState();
}

class _VenueDetailsPageState extends State<VenueDetailsPage> {
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
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(size: Size(12, 12)), 'assets/graphics/ic_venue_location_icon.png').then((icon) {
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
            Text("Venue Details",
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
                                        textStyle: const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis))),
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
                                        textStyle: const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis))),
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
              const SizedBox(height: 20),
              SizedBox(
                width: size.width,
                child: Text("Location",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      color: kBlackHeadingColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))),
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
                height: 200,
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
              const SizedBox(height: 20),
              SizedBox(
                width: size.width,
                child: Text("Order Reviews",
                    style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                      color: kBlackHeadingColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ))),
              ),
              const SizedBox(height: 10),
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
                              padding: EdgeInsets.zero,
                              decoration: const BoxDecoration(
                                color: kLoationFiedlBgColor,
                                borderRadius: BorderRadius.all(Radius.circular(16)),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(children: [
                                    Container(
                                      height: 30,
                                      decoration: const BoxDecoration(
                                        color: kLoationFiedlBgColor,
                                        borderRadius: BorderRadius.all(Radius.circular(16)),
                                      ),
                                      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                                        Flexible(flex: 1, fit: FlexFit.tight, child: Image.asset("assets/graphics/img_business_user_comment.png")),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Flexible(
                                          flex: 6,
                                          fit: FlexFit.tight,
                                          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                            Text(
                                              "Kenny Kessler",
                                              style: GoogleFonts.lato(
                                                  textStyle: const TextStyle(
                                                color: kBlackHeadingColor,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                              )),
                                            ),
                                            Row(children: [
                                              Image.asset(
                                                "assets/graphics/ic_rating_star_yellow_icon.png",
                                                height: 12,
                                              ),
                                              const SizedBox(width: 5),
                                              Text("3.1 Rating",
                                                  style: GoogleFonts.lato(
                                                    textStyle:
                                                        const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                                  ))
                                            ]),
                                          ]),
                                        ),
                                        Flexible(
                                          flex: 3,
                                          fit: FlexFit.tight,
                                          child: Container(
                                            alignment: Alignment.bottomRight,
                                            child: Text(
                                              "12 months ago",
                                              style: GoogleFonts.lato(
                                                textStyle:
                                                    const TextStyle(color: kBlackSubHeadingColor, fontSize: 10, overflow: TextOverflow.ellipsis),
                                              ),
                                            ),
                                          ),
                                        )
                                      ]),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Ipsam Magni Amet Dolores. Quisquam Exercitationem Repudiandae Consequatur Nihil Magni Ut Voluptatem Dolor. "
                                      "Asperiores Ea Distinctio Laboriosam Laudantium. Officiis Consequatur Molestias Sed Doloremque Sint Veniam.",
                                      style: GoogleFonts.lato(
                                        textStyle: const TextStyle(color: kBlackSubHeadingColor, fontSize: 10),
                                      ),
                                      maxLines: null,
                                    )
                                  ]))),
                          const SizedBox(height: 15),
                        ],
                      );
                    },
                    itemCount: 5,
                  )),
            ],
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      ),
    );
  }
}
