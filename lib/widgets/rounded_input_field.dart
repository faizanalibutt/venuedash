import 'package:flutter/material.dart';
import 'package:venuedash2/widgets/text_field_container.dart';
import '../utils/constants.dart';

class RoundedInputField extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  final TextInputType textInputType;
  final bool focus;
  final Color color;
  final Color textColor;
  final Color cursorColor;

  const RoundedInputField({
    Key? key,
    this.onChanged,
    this.focus = false,
    required this.textInputType,
    this.color = Colors.white,
    this.textColor = kWhite700Color,
    this.cursorColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: cursorColor,
        keyboardType: textInputType,
        autofocus: focus,
        style: TextStyle(color: textColor),
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
      ),
      borderColor: color,
    );
  }
}
