import 'package:bmi_tt9/Brains/BmiBrain.dart';
import 'package:bmi_tt9/Brains/Person.dart';
import 'package:bmi_tt9/Screans/Result.dart';
import 'package:bmi_tt9/Widgets/myCard.dart';
import 'package:bmi_tt9/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Widgets/myFAB.dart';
import '../constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  BmiBrain bmiBrain = BmiBrain();
  bool? _isMale;
  int _weight = BmiBrain().getWeight();
  int _age = BmiBrain().getAge();
  double? _height;
  double? bmi;
  Person? p;

  void initState() {
    _isMale = BmiBrain().IsMale();
    _weight = BmiBrain().getWeight();
    _age = BmiBrain().getAge();
    _height = BmiBrain().getHeight();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print(_isMale);
                      setState(() {
                        _isMale = true;
                      });
                      print(_isMale);
                    },
                    child: MyCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              size: 80,
                            ),
                            Text("Male", style: TextStyle(color: textColor)),
                          ],
                        ),
                        backgroundColor: _isMale == null
                            ? upperContainerBackground
                            : (_isMale == true
                                ? lowerContainersBackground
                                : upperContainerBackground)),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print(_isMale);
                      setState(() {
                        _isMale = false;
                      });
                      print(_isMale);
                    },
                    child: MyCard(
                      backgroundColor: _isMale == null
                          ? upperContainerBackground
                          : (_isMale == false
                              ? lowerContainersBackground
                              : upperContainerBackground),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            size: 80,
                          ),
                          Text(
                            "Female",
                            style: TextStyle(color: textColor),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: upperContainerBackground,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hight",
                      style: TextStyle(color: textColor),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        //todo:: formate the number (delete الاشياء العشرية)
//"${int.parse("$_height")}
                        Text(
                          "${_height!.toInt()}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 70),
                        ),
                        Text("cm"),
                      ],
                    ),
                    Slider(
                      value: _height!,
                      onChanged: (value) {
                        setState(() {
                          _height = value;
                        });
                      },
                      inactiveColor: textColor,
                      activeColor: buttonColor,
                      min: 100,
                      max: 250,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Expanded(
                    child: MyCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("WWIGHT", style: TextStyle(color: textColor)),
                      Text("$_weight",
                          style: TextStyle(
                              fontSize: 60, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MYFab(
                            onpressed: () {
                              setState(() {
                                _weight--;
                              });
                            },
                            child: Icon(Icons.remove),
                          ),
                          MYFab(
                            onpressed: () {
                              setState(() {
                                _weight++;
                              });
                            },
                            child: Icon(Icons.add),
                          ),

                          // FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
                          // FloatingActionButton(onPressed: (){},child: Icon(Icons.remove),),
                        ],
                      )
                    ],
                  ),
                )),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: MyCard(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: TextStyle(color: textColor)),
                        Text("$_age",
                            style: TextStyle(
                                fontSize: 60, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MYFab(
                              onpressed: () {
                                setState(() {
                                  _age--;
                                });
                              },
                              child: Icon(Icons.remove),
                            ),
                            MYFab(
                              onpressed: () {
                                setState(() {
                                  _age++;
                                });
                              },
                              child: Icon(
                                Icons.add,
                              ),
                            ),

                            // FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
                            // FloatingActionButton(onPressed: (){},child: Icon(Icons.remove),),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 50,
              width: double.infinity,
              child: Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    p = Person(
                        age: _age,
                        mass: _weight,
                        height: _height!.toInt(),
                        isMale: _isMale);
                    bmi = bmiBrain.getBMI(p!);

                    print(bmi);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScrean(
                          bmi: bmi!,
                        ),
                      ),
                    );
                  },
                  child: Text("Calculate"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
