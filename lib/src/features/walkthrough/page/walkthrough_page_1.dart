

import 'package:flutter/cupertino.dart';
import 'package:submission_bmi/src/features/walkthrough/page/walkthrough_base_page.dart';

class WalkthroughPage1 extends StatelessWidget {
  const WalkthroughPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WalkthroughBaseScreen(
        title: 'Selamat Datang Di BMI Application' ,
        subtitle:'Aplikasi untuk melakukan pengukuran index masa tubuh kalian',
      childOffset: 50,
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const[
            Image(
              height: 200,
              image: AssetImage('assets/character/walkthrough_logo.png'),
            )
          ],
        ),
    );
  }
}
