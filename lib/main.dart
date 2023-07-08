import 'package:bmi_tt9/Screans/Result.dart';
import 'package:bmi_tt9/Widgets/myFAB.dart';
import 'package:bmi_tt9/constants.dart';
import 'package:flutter/material.dart';

import 'Screans/Home.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        initialRoute: '/',
        // routes: {
        // '/': (context) =>  InputPage(),
        // 'lib/Screans/Result.dart': (context) => ResultScrean(bmi: 0,),},
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: lowerContainersBackground,
          secondary: Colors.yellow,
        ),
        appBarTheme: AppBarTheme(backgroundColor: backgroundColor,elevation: 0),

      ),
      home: InputPage(),
    );
  }
}

