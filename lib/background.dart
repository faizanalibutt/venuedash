import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        
        children: [
          Positioned(
            bottom: 0,
            child: SvgPicture.asset(
              "assets/graphics/vintage-floralated-frame.svg",
              height: size.height * 0.45,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
