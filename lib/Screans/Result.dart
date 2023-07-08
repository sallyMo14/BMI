import 'package:bmi_tt9/Brains/BmiBrain.dart';
import 'package:bmi_tt9/Widgets/myCard.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class ResultScrean extends StatelessWidget {
   ResultScrean({super.key,required this.bmi});
   BmiBrain brain =BmiBrain();
   double bmi ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: Colors.red,
          secondary: Colors.yellow,
        ),
        appBarTheme: AppBarTheme(backgroundColor: backgroundColor,elevation: 0),

      ),


      home: Scaffold(
        appBar: AppBar(
          title: Text("BMI cALCILATOR"),
          centerTitle: true,

        ),
        
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Your Result",style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold),),
                Expanded(child: SizedBox(),flex: 1,),
                Expanded(
                  flex: 18,
                  child: MyCard(
                    backgroundColor: upperContainerBackground
                    ,child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: [
                     Text("${brain.getResult(bmi)}",style:
                     TextStyle(color: brain.getResult(bmi)== "Normal" ? Colors.green : Colors.red,fontSize: 24
                     ),
                     ),
                     Text("${this.bmi.toStringAsFixed(2)}",style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold),),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
                         Text("Normal BMI range",style: TextStyle(color: textColor,fontSize: 24),),
                         SizedBox(height: 10,),
                         Text("${brain.getRange()}",style: TextStyle(fontSize: 24)),
                       ],
                     ),
                     Text("${brain.getAdvice(bmi)}",style: TextStyle(fontSize: 20)),
                     ElevatedButton(

                       onPressed: (){}, child: Text("Save Results",
                     style: TextStyle(fontSize: 25),),
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Color(0xff1D1F33),

                       ),

                     )
                   ],
                  ),),
                ),
                Expanded(child: SizedBox(),flex: 1,),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){

                    setState(){ }
                    Navigator.pop(context);


                  }, child: Text("Re_Calculate"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor

                    ),

                  ),
                )
              ],
            ),
          ),
        ),

      ),
    );
  }
}
// ElevatedButton.styleFrom(
// primary: Colors.black, // Background color
// onPrimary: Colors.amber,