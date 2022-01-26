import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:venuedash2/controller/text_controller.dart';
import 'package:venuedash2/routers/location_edit_page.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: InkWell(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
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
                            Text(
                                widget.textControllerGet.controllerTextValue
                                    .value,
                                style: GoogleFonts.lato(
                                    textStyle: const TextStyle(
                                  color: kBlackHeadingColor,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ))),
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
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              //tileColor: Colors.green,
              onTap: () {},
              leading: const Icon(Icons.person),
              hoverColor: Colors.grey,
              title: const Text("My Account"),
              trailing: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
