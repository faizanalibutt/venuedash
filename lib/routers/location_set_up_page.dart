import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/widgets/rounded_location_input_field.dart';

class LocationSetUpPage extends StatefulWidget {
  const LocationSetUpPage({Key? key}) : super(key: key);

  @override
  _LocationSetUpPageState createState() => _LocationSetUpPageState();
}

class _LocationSetUpPageState extends State<LocationSetUpPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * .1,
            ),
            Container(
                height: size.height * .05,
                alignment: Alignment.center,
                child: const FittedBox(
                  child: Text("Set your Location",
                      style:
                          TextStyle(color: kBlackHeadingColor, fontSize: 24)),
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: const AutoSizeText(
                "Explore venues and shops near you by using your current "
                "location or searching a location manually.",
                style: TextStyle(color: kBlackSubHeadingColor, fontSize: 12),
                minFontSize: 8,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(
              height: size.height * .08,
            ),
            SvgPicture.asset("assets/graphics/welcome_illustration.svg"),
            SizedBox(
              height: size.height * .05,
            ),
            RoundedLocationInputField(
              textInputType: TextInputType.text,
              onChanged: (value) {},
              focus: false,
              color: Colors.grey,
              textColor: kBlackFieldColor,
              cursorColor: Colors.black,
              hintText: "Search Manually...",
            ),
          ],
        ),
      ),
    );
  }
}
