import 'package:flutter/material.dart';
import 'package:venuedash2/utils/constants.dart';
import 'package:venuedash2/widgets/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final IconData? icon;
  final ValueChanged<String>? onChanged;

  final bool isPwdVisible;
  final VoidCallback pwdCallbackOn;
  final VoidCallback pwdCallbackOff;

  const RoundedPasswordField(
      {Key? key,
      this.icon,
      this.onChanged,
      required this.isPwdVisible,
      required this.pwdCallbackOn,
      required this.pwdCallbackOff})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isPwdVisible,
        onChanged: onChanged,
        cursorColor: Colors.white,
        style: const TextStyle(color: kWhite700Color),
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixIcon: !isPwdVisible
                ? IconButton(
                    onPressed: () {
                      pwdCallbackOn();
                    },
                    icon:
                        const Icon(Icons.visibility, color: kPrimaryLightColor))
                : IconButton(
                    onPressed: () {
                      pwdCallbackOff();
                    },
                    icon: const Icon(Icons.visibility_off,
                        color: kPrimaryLightColor))),
      ),
    );
  }
}
