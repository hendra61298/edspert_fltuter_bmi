
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/app_color.dart';

class CustomCardWeight extends StatelessWidget {
  const CustomCardWeight({
    Key? key,
    required this.child
  }) : super(key: key);

  /// Widget Child For Card
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side:const BorderSide(
              color: AppColor.mainPurpleColor,
              width: 0.3,
            )
        ),
        shadowColor: AppColor.mainPurpleColor,
        elevation:4,
        color: AppColor.secondPurple,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}
