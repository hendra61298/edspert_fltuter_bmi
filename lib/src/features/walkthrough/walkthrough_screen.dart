
import 'dart:async';
import 'dart:math';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submission_bmi/src/config/app_color.dart';
import 'package:submission_bmi/src/features/walkthrough/page/walkthrough_page_1.dart';
import 'package:submission_bmi/src/features/walkthrough/page/walkthrough_page_2.dart';
import 'package:submission_bmi/src/features/walkthrough/page/walkthrough_page_3.dart';
import 'package:submission_bmi/src/features/walkthrough/page/walkthrough_page_4.dart';

import '../../core/router/app_route_constant.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({Key? key}) : super(key: key);

  @override
  State<WalkthroughScreen> createState() => _WalkthroughScreenState();
}

class _WalkthroughScreenState extends State<WalkthroughScreen> {
  /// PageView's controller.
  late PageController _pageController;

  /// PageView's current page.
  double _currentPage = 0.0;

  /// Walkthrough pages widget.
  List<Widget> walkthroughPages = [
    const WalkthroughPage1(),
    const WalkthroughPage2(),
    const WalkthroughPage3(),
    const WalkthroughPage4(),
  ];


  /// Login button click listener
  void handleNext() async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_run', false);

    Future.sync(() {
      Router.neglect(context, () {
        GoRouter.of(context).pushReplacement(
            AppRoute.mainScreen.path
        );
      });
    });
  }
  @override
  void initState() {
    super.initState();
    int initialPage = 0;
    _currentPage = initialPage.toDouble();
    _pageController = PageController(initialPage: initialPage);


    /// Carousel timer.
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (mounted) {
        if (_currentPage.roundToDouble() < walkthroughPages.length - 1) {
          _pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          );
        } else {
          timer.cancel();
        }
      }
    });
  }
  /// NotificationListener's onNotification listener.
  bool _onScroll(ScrollNotification notification) {
    final metrics = notification.metrics;
    if (metrics is PageMetrics && metrics.page != null) {
      if (mounted) {
        setState(() => _currentPage = metrics.page!);
      }
    }
    return false;
  }


  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    double topLogoOpacity = min(_currentPage, 1.0);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              child: NotificationListener<ScrollNotification>(
                onNotification: _onScroll,
                child: PageView(
                  controller: _pageController,
                  children: walkthroughPages,
                ),
              ),
            ),
            Positioned(
              top: 40,
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: topLogoOpacity,
                duration: const Duration(milliseconds: 100),
                child: Center(
                 child: Text(
                   'Bmi Apps',
                   style: TextStyle(
                     color: AppColor.mainPurpleColor,
                     fontSize: 70,
                     fontWeight: FontWeight.bold,
                     fontFamily: GoogleFonts.allison().fontFamily
                   ),
                 ),
                )
              ),
            ),
            Positioned(
              bottom: 40.0,
              left: 40.0,
              right: 40.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DotsIndicator(
                    dotsCount: 4,
                    position: _currentPage,
                    decorator: DotsDecorator(
                      size: const Size.square(8.0),
                      activeSize: const Size(18.0, 8.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      activeColor: theme.colorScheme.secondary,
                      color: const Color(0xFFC4C4C4),
                      spacing: const EdgeInsets.all(2.0),
                    ),
                  ),
                  const SizedBox(height: 36),
                  ElevatedButton(
                    style: ButtonStyle(
                       backgroundColor:MaterialStateProperty.all(AppColor.mainPurpleColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                            )
                        )
                    ),
                    onPressed: handleNext,
                    child: const Text(
                        'Ayo Hitung',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
