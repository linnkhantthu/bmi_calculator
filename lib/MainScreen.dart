import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MainScreen extends StatefulWidget {
  MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

enum Gender { male, female }

Gender selectedGender = Gender.male;

class _MainScreenState extends State<MainScreen> {
  static const Color backgroundColor = Color(0xff080B23);
  Color foregroundColor = Color(0xff171830);

  //before selecting
  Color genderMaleColor = backgroundColor;
  Color genderFemaleColor = backgroundColor;

  Color genderSelectedColor = Color(0xff171830);
  int weight = 130;
  int age = 18;

  int _currentHeight = 160;

  @override
  Widget build(BuildContext context) {
    var screenSize = [
      MediaQuery.of(context).size.width,
      MediaQuery.of(context).size.height
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI CALCULATOR",
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                          child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                            genderMaleColor = genderSelectedColor;
                            genderFemaleColor = backgroundColor;
                          });
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: genderMaleColor,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: screenSize[0] * 0.5,
                            height: screenSize[1] * 0.2,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Image(
                                    image: AssetImage(
                                      "assets/images/gender_male.png",
                                    ),
                                    width: 100,
                                    height: 100,
                                  ),
                                  Text(
                                    "MALE",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ),
                        ),
                      )),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                          child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                            genderFemaleColor = genderSelectedColor;
                            genderMaleColor = backgroundColor;
                          });
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: genderFemaleColor,
                          ),
                          child: Container(
                            alignment: Alignment.center,
                            width: screenSize[0] * 0.5,
                            height: screenSize[1] * 0.2,
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: <Widget>[
                                  Image(
                                    image: AssetImage(
                                      "assets/images/gender_female.png",
                                    ),
                                    width: 100,
                                    height: 100,
                                  ),
                                  Text(
                                    "FEMALE",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ),
                        ),
                      )),
                    ),
                  ),
                ],
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                      alignment: Alignment.center,
                      width: screenSize[0] * 1,
                      height: screenSize[1] * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: foregroundColor,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: Text(
                              "HEIGHT $_currentHeight cm",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Slider(
                              min: 0,
                              max: 300,
                              value: _currentHeight.toDouble(),
                              onChanged: (double value) {
                                setState(() {
                                  _currentHeight = value.toInt();
                                });
                              },
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          alignment: Alignment.center,
                          width: screenSize[0] * 0.5,
                          height: screenSize[1] * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: foregroundColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "WEIGHT",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "$weight kg",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.all(screenSize[1] * 0.01),
                                      child: Container(
                                        height: screenSize[1] * 0.07,
                                        width: screenSize[1] * 0.07,
                                        alignment: Alignment.center,
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                setState(() {
                                                  if (weight > 0) {
                                                    weight -= 1;
                                                  }
                                                });
                                              });
                                            },
                                            onDoubleTap: () {
                                              setState(() {
                                                if (weight > 0) {
                                                  weight -= 5;
                                                }
                                              });
                                            },
                                            child: Ink(
                                                child: Container(
                                              alignment: Alignment.center,
                                              height: screenSize[1] * 0.07,
                                              width: screenSize[1] * 0.07,
                                              decoration: new BoxDecoration(
                                                color: Color(0xff4B4E5E),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Text(
                                                "-",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ))),
                                      ),
                                    )),
                                    Flexible(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.all(screenSize[1] * 0.01),
                                      child: Container(
                                        height: screenSize[1] * 0.07,
                                        width: screenSize[1] * 0.07,
                                        alignment: Alignment.center,
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (weight > 0) {
                                                  weight += 1;
                                                }
                                              });
                                            },
                                            onDoubleTap: () {
                                              setState(() {
                                                if (weight > 0) {
                                                  weight += 5;
                                                }
                                              });
                                            },
                                            child: Ink(
                                                child: Container(
                                              alignment: Alignment.center,
                                              height: screenSize[1] * 0.07,
                                              width: screenSize[1] * 0.07,
                                              decoration: new BoxDecoration(
                                                color: Color(0xff4B4E5E),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Text(
                                                "+",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ))),
                                      ),
                                    )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                  Flexible(
                    child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          alignment: Alignment.center,
                          width: screenSize[0] * 0.5,
                          height: screenSize[1] * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: foregroundColor,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Text(
                                  "AGE",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "$age",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Flexible(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.all(screenSize[1] * 0.01),
                                      child: Container(
                                        height: screenSize[1] * 0.07,
                                        width: screenSize[1] * 0.07,
                                        alignment: Alignment.center,
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                setState(() {
                                                  if (age > 0) {
                                                    age -= 1;
                                                  }
                                                });
                                              });
                                            },
                                            onDoubleTap: () {
                                              setState(() {
                                                if (age > 0) {
                                                  age -= 5;
                                                }
                                              });
                                            },
                                            child: Ink(
                                                child: Container(
                                              alignment: Alignment.center,
                                              height: screenSize[1] * 0.07,
                                              width: screenSize[1] * 0.07,
                                              decoration: new BoxDecoration(
                                                color: Color(0xff4B4E5E),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Text(
                                                "-",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ))),
                                      ),
                                    )),
                                    Flexible(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.all(screenSize[1] * 0.01),
                                      child: Container(
                                        height: screenSize[1] * 0.07,
                                        width: screenSize[1] * 0.07,
                                        alignment: Alignment.center,
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (age > 0) {
                                                  age += 1;
                                                }
                                              });
                                            },
                                            onDoubleTap: () {
                                              setState(() {
                                                if (age > 0) {
                                                  age += 5;
                                                }
                                              });
                                            },
                                            child: Ink(
                                                child: Container(
                                              alignment: Alignment.center,
                                              height: screenSize[1] * 0.07,
                                              width: screenSize[1] * 0.07,
                                              decoration: new BoxDecoration(
                                                color: Color(0xff4B4E5E),
                                                shape: BoxShape.circle,
                                              ),
                                              child: Text(
                                                "+",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ))),
                                      ),
                                    )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                      alignment: Alignment.center,
                      width: screenSize[0] * 1,
                      height: screenSize[1] * 0.1,
                      child: InkWell(
                          onTap: () async {
                            var result = calculate();
                            await showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                      title: Text("${result[0]}"),
                                      content: Text("${result[1]}"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Text("okay"),
                                        ),
                                      ],
                                    ));
                          },
                          child: Ink(
                              color: Colors.pink,
                              child: Container(
                                alignment: Alignment.center,
                                width: screenSize[0] * 1,
                                height: screenSize[1] * 0.2,
                                child: Text(
                                  "CALCULATE",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )))),
                ),
              ),
            ],
          ),
        ));
  }

  dynamic calculate() {
    var result = ["Result", ""];
    print("Weight $weight");
    print("Height ${pow(_currentHeight / 100, 2)}");
    var bmi = (weight / pow(_currentHeight / 100, 2));
    print(bmi);
    if (bmi >= 18.5 && bmi <= 24.9) {
      result[1] = "You are healthy, keep it up.";
    } else if (bmi >= 25 && bmi <= 29.9) {
      result[1] =
          "You are overweight, you need to lose weight and have healthy body. Good luck!";
    } else if (bmi >= 30) {
      result[1] =
          "You are a hugely obese fat, you need to lose weight and have healthy body. Good luck!";
    } else {
      result[1] = "You are too thin.";
    }
    return result;
  }
}
