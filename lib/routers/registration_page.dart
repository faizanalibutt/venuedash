import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:venuedash2/routers/privacy_policy_page.dart';
import 'package:venuedash2/routers/location_set_up_page.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/routers/login_page.dart';
import 'package:venuedash2/widgets/outlined_border_button_long.dart';
import 'package:venuedash2/widgets/rounded_button_long.dart';
import 'package:venuedash2/widgets/rounded_input_field.dart';
import 'package:venuedash2/widgets/rounded_password_field.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool isChecked = false;
  bool _isPwdVisible = true;
  bool _isPwdVisible2 = true;
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 40),
            Image.asset("assets/graphics/img_venue_dash_icon.png"),
            const SizedBox(height: 20),
            Stack(
              children: [
                Positioned.fill(
                  child: SvgPicture.asset(
                    "assets/graphics/images/account_bg.svg",
                    fit: BoxFit.fill,
                  ),
                ),
                Column(children: [
                  const SizedBox(height: 90),
                  Container(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    alignment: Alignment.center,
                    child: FittedBox(
                        child: Text(
                      "Create An Account.",
                      style: GoogleFonts.lato(textStyle: const TextStyle(color: Colors.white, fontSize: 24)),
                    )),
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    alignment: Alignment.topCenter,
                    child: FittedBox(
                        child: Text(
                      "Please enter below details to get registered.",
                      style: GoogleFonts.lato(textStyle: const TextStyle(color: kWhite500Color, fontSize: 12)),
                    )),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.only(left: 50),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Full Name",
                      style: GoogleFonts.lato(textStyle: const TextStyle(color: kWhite500Color, fontSize: 10)),
                    ),
                  ),
                  RoundedInputField(
                    textInputType: TextInputType.name,
                    onChanged: (value) {},
                    focus: true,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 50),
                    alignment: Alignment.topLeft,
                    child: Text("Email", style: GoogleFonts.lato(textStyle: const TextStyle(color: kWhite500Color, fontSize: 10))),
                  ),
                  RoundedInputField(
                    textInputType: TextInputType.emailAddress,
                    onChanged: (value) {},
                    focus: false,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 50),
                    alignment: Alignment.topLeft,
                    child: Text("Password", style: GoogleFonts.lato(textStyle: const TextStyle(color: kWhite500Color, fontSize: 10))),
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {},
                    isPwdVisible: _isPwdVisible,
                    pwdCallbackOn: () {
                      setState(() {
                        _isPwdVisible = !_isPwdVisible;
                      });
                    },
                    pwdCallbackOff: () {
                      setState(() {
                        _isPwdVisible = !_isPwdVisible;
                      });
                    },
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 50),
                    alignment: Alignment.topLeft,
                    child: Text("Confirm Password", style: GoogleFonts.lato(textStyle: const TextStyle(color: kWhite500Color, fontSize: 10))),
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {},
                    isPwdVisible: _isPwdVisible2,
                    pwdCallbackOn: () {
                      setState(() {
                        _isPwdVisible2 = !_isPwdVisible2;
                      });
                    },
                    pwdCallbackOff: () {
                      setState(() {
                        _isPwdVisible2 = !_isPwdVisible2;
                      });
                    },
                  ),
                  Row(
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              isChecked = !isChecked;
                            });
                          },
                          child: Container(
                              padding: const EdgeInsets.only(left: 30.0),
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(shape: BoxShape.circle),
                              child: isChecked
                                  ? SvgPicture.asset("assets/graphics/images/condition_img_check.svg")
                                  : SvgPicture.asset("assets/graphics/images/condition_img_not_check.svg"))),
                      const SizedBox(width: 5.0),
                      InkWell(
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const PrivacyPolicyPage())),
                          child: Text("Accept terms & conditions",
                              style: GoogleFonts.lato(textStyle: const TextStyle(color: Colors.white, fontSize: 12))))
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  RoundedButtonLong(
                    text: "Register",
                    press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LocationSetUpPage())),
                    imgName: 'assets/graphics/ic_register_green_icon.png',
                    color: Colors.white,
                    textColor: kPrimaryColor,
                  ),
                  Container(
                      height: 60.0,
                      padding: const EdgeInsets.symmetric(horizontal: 80.0),
                      alignment: Alignment.center,
                      child: const Divider(
                        color: Colors.white30,
                        height: 1,
                      )),
                  Text("Please enter below details to get registered.",
                      style: GoogleFonts.lato(textStyle: const TextStyle(color: Colors.white54, fontSize: 12))),
                  const SizedBox(height: 10),
                  OutlinedBorderButtonLong(
                      text: "Login",
                      press: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage())),
                      color: Colors.white,
                      textColor: Colors.white,
                      imgName: 'assets/graphics/ic_logo_white_icon.png'),
                  const SizedBox(height: 45),
                  SizedBox(
                    height: MediaQuery.of(context).viewInsets.bottom,
                  ),
                ]),
              ],
            )
          ]),
        ));
  }
}
