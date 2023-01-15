
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submission_bmi/src/config/app_color.dart';
import 'package:submission_bmi/src/core/router/app_route_constant.dart';
import 'package:submission_bmi/src/core/router/app_router.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ResultScreen extends StatefulWidget {
  final double result;
  final String gender;

  const ResultScreen({
    Key? key,
    required this.result,
    required this.gender
  }) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {

 late double result;
 late String gender;

  String statusBmi = '';
  Color colorStatus = Colors.white;

  void _setStatus(){
    if(result < 18.5){
      statusBmi = 'Berat Badan Kurang';
      colorStatus = Colors.blueAccent;
    }
    if(result >= 18.5 && result <= 22.9){
      statusBmi = 'Berat Badan Normal';
      colorStatus = Colors.green;
    }
    if(result >= 23 && result <= 29.9){
      statusBmi = 'Berat Badan Berlebih';
      colorStatus = Colors.yellow;
    }
    if(result >= 30 ){
      statusBmi = 'Obesitas';
      colorStatus = Colors.red;
    }
  }
  @override
  void initState() {
    super.initState();
     result = widget.result;
     gender = widget.gender;
    _setStatus();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            GoRouter.of(context).goNamed(
                AppRoute.mainScreen.name
            );
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColor.secondPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11.0),
        child: Wrap(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hasil Kamu',
                  style: TextStyle(
                      fontFamily: GoogleFonts.rubik().fontFamily,
                      fontSize: 30,
                      color: AppColor.mainPurpleColor,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(1.0),
                          offset: const Offset(0, 1),
                          blurRadius: 2,
                        )
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40.0),
                  child: SizedBox(
                    height: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side:const BorderSide(
                            color: AppColor.mainPurpleColor,
                            width: 1,
                          )
                      ),
                      shadowColor: AppColor.mainPurpleColor,
                      elevation:4,
                      color: AppColor.mainPurpleColor,
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          children: [
                            Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    statusBmi,
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.rubik().fontFamily,
                                        fontSize: 25,
                                        color: colorStatus,
                                        shadows: [
                                          Shadow(
                                            color: Colors.black.withOpacity(1.0),
                                            offset: const Offset(1, 2),
                                            blurRadius: 2,
                                          )
                                        ]
                                    ),
                                  ),
                                )
                            ),
                            Expanded(
                                child: Text(
                                  result.toStringAsFixed(2),
                                  style: TextStyle(
                                      fontFamily: GoogleFonts.rubik().fontFamily,
                                      fontSize: 30,
                                      color: Colors.black,
                                      shadows: [
                                        Shadow(
                                          color: Colors.black.withOpacity(1.0),
                                          offset: const Offset(1, 2),
                                          blurRadius: 2,
                                        )
                                      ]
                                  ),
                                )
                            ),
                            Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'Selalu jaga kesehatan '
                                            'dan pola makan kamu. '
                                            'Memiliki indekes masa tubuh '
                                            'yang baik dapat membantu kamu mendapatkan '
                                            'kesehatan dan bentuk badan yang di inginkan',
                                        textAlign: TextAlign.justify ,
                                        style: TextStyle(
                                          fontFamily: GoogleFonts.rubik().fontFamily,
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                            ),
                            Expanded(
                              child: SfLinearGauge(
                                maximum: 40,
                                markerPointers: [
                                  LinearShapePointer(value: result, height: 25, width: 18)
                                ],
                                barPointers: [
                                  LinearBarPointer(
                                      value: result,
                                      //Change the color
                                      color: colorStatus
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: ElevatedButton(
                              onPressed: (){
                                GoRouter.of(context).goNamed(
                                    AppRoute.mainScreen.name
                                );
                              },
                              style: ButtonStyle(
                                  backgroundColor:MaterialStateProperty.all(AppColor.mainPurpleColor),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(18.0),
                                      )
                                  )
                              ),
                              child: const Text('Ayo Hitung Ulang')),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )


          ],
        ),
      ),
    );
  }
}

