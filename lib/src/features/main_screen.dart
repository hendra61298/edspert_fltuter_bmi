
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission_bmi/src/config/app_color.dart';
import 'package:submission_bmi/src/core/router/app_route_constant.dart';
import 'package:submission_bmi/src/core/router/app_router.dart';

import '../widget/custom_card_gender.dart';
import '../widget/custom_card_weight.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  bool manClick = true;
  bool womenClick =false;

  double sliderHeight = 0.0;
  int weight = 0;
  int age = 0;
  String gender ="Pria";

  void _countBMI () async{
    final double bmi ;

    SnackBar snackBar(String text){
      return SnackBar(
        duration: const Duration(seconds: 1),
        elevation: 4,

        backgroundColor: AppColor.mainPurpleColor,
        content: Text(text),
        action: SnackBarAction(label: '', onPressed: () {
          ScaffoldMessenger.of(context).clearSnackBars();
        },
        ),
      );
    }

    if(weight == 0){    
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar('Masukan Berat Badan Anda')
      );
      return;
    }
    if(sliderHeight == 0){
      ScaffoldMessenger.of(context).showSnackBar(
          snackBar('Masukan Tinggi Badan Anda')
      );
      return;
    }
    final heightInMeter = sliderHeight/100;
    bmi = (weight / (heightInMeter * heightInMeter) );
    Router.neglect(context, () {
      GoRouter.of(context).goNamed(
          AppRoute.resultScreen.name,
          queryParams: {
            'result' :bmi.toString(),
            'gender' : gender
          }
      );
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 3,
            child: Stack(
            children: [
              ClipPath(
                clipper: BackgroundWaveClipper(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 310,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [AppColor.mainPurpleColor, Color(0xFFF6EFE9)],
                      )),
                ),
              ),
              Positioned(
                  top: 50,
                  bottom: 0,
                  left: 20,
                  right: 0,
                  child: Text(
                    'BMI APPLICATION',
                    style: TextStyle(
                        fontFamily: GoogleFonts.rubik().fontFamily,
                        fontSize: 30,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(1.0),
                            offset: const Offset(2, 3),
                            blurRadius: 4,
                          )
                        ]
                    ),
                  )
              ),
              Positioned(
                top: 90,
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  children:  [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              manClick = true;
                              womenClick= false;
                              gender = "Pria";
                            });
                          },
                          child:  CustomCardGender(
                            onClick: manClick,
                            child:  const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Image(
                                  image: AssetImage('assets/character/character_man.png')
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              manClick = false;
                              womenClick= true;
                              gender = "Wanita";
                            });
                          },
                          child:  CustomCardGender(
                            onClick: womenClick,
                            child: const Image(
                                image: AssetImage('assets/character/character_women.png')
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
        ),
          ),
          Expanded(
            flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CustomCardWeight(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 25.0,bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       const Expanded(
                            child: Text(
                                'Tinggi Badan',
                              style: TextStyle(
                                fontSize: 25
                              ),
                            )
                        ),
                        Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${sliderHeight.toInt()}',
                                  style: const TextStyle(
                                      fontSize: 40
                                  ),
                                ),
                                const Text(
                                  'cm',
                                  style: TextStyle(
                                      fontSize: 20
                                  ),
                                ),
                              ],
                            )
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Slider(
                              activeColor: AppColor.mainPurpleColor,
                              thumbColor: Colors.black,
                              inactiveColor: AppColor.mainGreyColor,
                              value: sliderHeight,
                              min: 0.0,
                              max: 300.0,
                              onChanged: (value) {
                                setState(() {
                                  sliderHeight = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ),
          Expanded(
            flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomCardWeight(
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Column(
                            children: [
                             const Expanded(
                                  child:Text(
                                    'Berat(kg)',
                                      style: TextStyle(
                                          fontSize: 20
                                    ),
                                  )
                              ),
                              Expanded(
                                  child:Text(
                                    '$weight',
                                    style: const TextStyle(
                                        fontSize: 30
                                    ),
                                  )
                              ),
                              Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if(weight <= 0){
                                              return;
                                            }
                                            setState(() {
                                              weight--;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.mainPurpleColor,
                                            fixedSize: const Size(200, 200),
                                            shape: const CircleBorder(),
                                          ),
                                          child: const Text(
                                            '-',
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if(weight >= 1000){
                                              return;
                                            }
                                            setState(() {
                                              weight++;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.mainPurpleColor,
                                            fixedSize: const Size(200, 200),
                                            shape: const CircleBorder(),
                                          ),
                                          child: const Text(
                                            '+',
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: CustomCardWeight(
                        child: Padding(
                          padding: const EdgeInsets.all(11.0),
                          child: Column(
                            children: [
                              const Expanded(
                                  child:Text(
                                    'Umur(tahun)',
                                    style: TextStyle(
                                        fontSize: 20
                                    ),
                                  )
                              ),
                              Expanded(
                                  child:Text(
                                    '$age',
                                    style: const TextStyle(
                                        fontSize: 30
                                    ),
                                  )
                              ),
                              Expanded(
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if(age <= 0){
                                              return;
                                            }
                                            setState(() {
                                              age--;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.mainPurpleColor,
                                            fixedSize: const Size(200, 200),
                                            shape: const CircleBorder(),
                                          ),
                                          child: const Text(
                                            '-',
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if(age >= 300){
                                              return;
                                            }
                                            setState(() {
                                              age++;
                                            });
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColor.mainPurpleColor,
                                            fixedSize: const Size(200, 200),
                                            shape: const CircleBorder(),
                                          ),
                                          child: const Text(
                                            '+',
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: ElevatedButton(
                            onPressed: _countBMI,
                            style: ButtonStyle(
                                backgroundColor:MaterialStateProperty.all(AppColor.mainPurpleColor),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                    )
                                )
                            ),
                            child: const Text('Hitung')),
                      ),
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    final p0 = size.height * 0.75;
    path.lineTo(0.0, p0);

    final controlPoint = Offset(size.width * 0.4, size.height);
    final endPoint = Offset(size.width, size.height / 2);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(BackgroundWaveClipper oldClipper) =>
      oldClipper != this;
}

