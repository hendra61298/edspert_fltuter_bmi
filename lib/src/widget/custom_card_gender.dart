
import 'package:flutter/material.dart';

import '../config/app_color.dart';

class CustomCardGender extends StatelessWidget {

  const CustomCardGender({Key? key,
    required this.child,
    required this.onClick
  }) : super(key: key);

  /// Widget Child For Card
  final Widget child;

  /// Set Card Clicked
  final bool onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      width: 100,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
        ),
        shadowColor: AppColor.mainPurpleColor,
        elevation: onClick? 10 : 1,
        color: onClick? AppColor.mainPurpleColor : AppColor.secondPurple,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
