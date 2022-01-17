import 'package:flutter/material.dart';
import 'package:venuedash2/widgets/text_field_location_container.dart';
import '../utils/constants.dart';

class RoundedLocationInputField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextInputType textInputType;
  final bool focus;
  final Color color;
  final Color textColor;
  final Color cursorColor;
  final String hintText;

  const RoundedLocationInputField(
      {Key? key,
      this.onChanged,
      this.focus = false,
      required this.textInputType,
      this.color = Colors.white,
      this.textColor = kWhite700Color,
      this.cursorColor = Colors.white,
      this.hintText = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldLocationContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: cursorColor,
        keyboardType: textInputType,
        autofocus: focus,
        style: TextStyle(color: textColor),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25.7),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25.7),
            ),
            
            suffixIcon: const InkWell(
                // replace iconbutton with custom widget.
                child: IconButton(
              icon: Icon(Icons.search, color: kPrimaryColor),
              onPressed: null,
            ))),
      ),
      borderColor: color,
    );
  }

  void searchAddress() {}
}
