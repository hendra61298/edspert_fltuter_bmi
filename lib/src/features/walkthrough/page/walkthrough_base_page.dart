
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalkthroughBaseScreen extends StatelessWidget {
  const WalkthroughBaseScreen({
    Key? key,
    required this.title,
    required this.subtitle,
    this.childOffset = 0.0,
    required this.child,
  }) : super(key: key);

  /// Page's title
  final String title;

  /// Page's subtitle
  final String subtitle;

  /// Child's bottom offset.
  final double childOffset;

  /// Page's child widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: (height / 2.8) + childOffset,
            left: 40.0,
            right: 40.0,
            child: child,
          ),
          Positioned(
            bottom: (height / 2.8) - 120 +childOffset,
            left: 40.0,
            right: 40.0,
            child: Column(
              children: [
                Text(
                  title,
                  style: theme.textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                Text(
                  subtitle,
                  style: theme.textTheme.bodyText2,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
