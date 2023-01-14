
import 'package:flutter/cupertino.dart';
import 'package:submission_bmi/src/features/walkthrough/page/walkthrough_base_page.dart';

class WalkthroughPage4 extends StatelessWidget {
  const WalkthroughPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WalkthroughBaseScreen(
      title: 'Penampilan Tubuh',
      subtitle: 'Memiliki indeks masa tubuh yang baik juga dapat dilihat dari penampilan sesorang',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Image(
            image: AssetImage('assets/character/bmi_women.png'),
          )
        ],
      ),
    );
  }
}
