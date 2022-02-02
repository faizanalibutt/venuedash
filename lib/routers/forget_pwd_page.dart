import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/widgets/rounded_button_long.dart';
import 'package:venuedash2/widgets/rounded_input_field.dart';

class ForgetPwdPage extends StatelessWidget {
  const ForgetPwdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * .05),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Image.asset(
                    "assets/graphics/ic_back_button.png",
                  ),
                ),
                Container(
                    height: size.height * .1,
                    padding: const EdgeInsets.only(left: 18.0),
                    alignment: Alignment.centerLeft,
                    child: const FittedBox(
                      child: Text("Forgot Password?",
                          style: TextStyle(
                              color: kBlackHeadingColor, fontSize: 24)),
                    )),
              ],
            ),
            Container(
                height: size.height * .1,
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                alignment: Alignment.topLeft,
                child: const AutoSizeText(
                  "Enter the email address associated with your "
                  "account and we'll send you a password reset link.",
                  style: TextStyle(color: kBlackSubHeadingColor, fontSize: 12),
                  minFontSize: 8,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                )),
            SizedBox(
              height: size.height * .7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SvgPicture.asset(
                      "assets/graphics/images/forgot_image_bg.svg",
                    ),
                    SizedBox(
                      height: size.height * .05,
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 50),
                      alignment: Alignment.topLeft,
                      child: const Text(
                        "Email",
                        style: TextStyle(
                            color: kBlackSubHeadingColor, fontSize: 10),
                      ),
                    ),
                    RoundedInputField(
                      textInputType: TextInputType.emailAddress,
                      onChanged: (value) {},
                      focus: true,
                      color: kPrimaryColor,
                      textColor: kBlackFieldColor,
                      cursorColor: Colors.black,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RoundedButtonLong(
                      text: "Send Reset Link",
                      press: () async {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        14.0)), //this right here
                                child: SizedBox(
                                  height: 270,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const FittedBox(
                                            child: Text(
                                          "Success!",
                                          style: TextStyle(
                                              color: kBlackHeadingColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        SvgPicture.asset(
                                            "assets/graphics/images/forget_circle_img.svg"),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        const AutoSizeText(
                                          "We have successfully sent your password"
                                          " reset link on your email address. "
                                          "Please open the link from your email to reset your password.",
                                          style: TextStyle(
                                              color: kBlackSubHeadingColor,
                                              fontSize: 16),
                                          minFontSize: 8,
                                          maxLines: 3,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(
                                          height: 12,
                                        ),
                                        RoundedButtonLong(
                                          text: "Okay",
                                          press: () =>
                                              Navigator.pop(context, 'OK'),
                                          imgName:
                                              "assets/graphics/ic_okay_icon.png",
                                          textColor: Colors.white,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      },
                      imgName: 'assets/graphics/forget_reset_img.png',
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      onPrimaryColor: Colors.white54,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).viewInsets.bottom,
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
