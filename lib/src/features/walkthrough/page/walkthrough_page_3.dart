
import 'package:flutter/cupertino.dart';
import 'package:submission_bmi/src/features/walkthrough/page/walkthrough_base_page.dart';

class WalkthroughPage3 extends StatelessWidget {
  const WalkthroughPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WalkthroughBaseScreen(
      title: 'Makan Makanan Sehat',
      subtitle: 'Dengan selalu menjaga pola makan dan mengkonsumsi makanan yang sehat, dapat membantu kita mengelola indeks masa tubuh',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: const [
          Image(
            image: AssetImage('assets/character/bmi_food.png'),
          )
        ],
      ),
    );
  }
}
