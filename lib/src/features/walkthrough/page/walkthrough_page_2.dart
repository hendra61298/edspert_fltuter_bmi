
import 'package:flutter/cupertino.dart';
import 'package:submission_bmi/src/features/walkthrough/page/walkthrough_base_page.dart';
import 'package:submission_bmi/src/features/walkthrough/walkthrough_screen.dart';

class WalkthroughPage2 extends StatelessWidget {
  const WalkthroughPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WalkthroughBaseScreen(
      title: 'Tolak Ukur Indeks Masa Tubuh',
      subtitle: 'Kalian sobat sehat dapat selalu mengecek indeks masa tubuh kalian dengan ketentuan seperti ini',
      childOffset: 50,
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('assets/character/bmi_vector.png'),
          )
        ],
      ),
    );
  }
}
