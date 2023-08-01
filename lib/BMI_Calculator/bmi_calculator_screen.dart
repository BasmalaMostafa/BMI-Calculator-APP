import 'dart:math';

import 'package:bmi_calculator/BMI_Calculator/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  bool? isFemale;
  double height=120;
  double age=20;
  double weight=60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
            children: [
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isFemale=false;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:isFemale==null || isFemale==true? Colors.grey[400]:Colors.blue
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Image(image: AssetImage('assets/images/male.png'),width: 100,height: 100,),
                          Text('MALE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        isFemale=true;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color:isFemale==true?Colors.blue:Colors.grey[400]
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(image: AssetImage('assets/images/female.png',),width: 100,height: 100,),
                          //Icon(Icons.ac_unit),
                          SizedBox(
                            height: 10,
                          ),
                          Text('FEMALE',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                        ],
                      ),
                    ),
                  ),
                )
                ],
          ),
              )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[400]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT',style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children:  [
                      Text('$height',style: const TextStyle(fontSize: 40,
                          fontWeight: FontWeight.w900),),
                      const Text('CM',style: TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Slider(value: height,
                      max: 220,
                      min: 80,
                      onChanged: (value){
                    setState(() {
                      height=value.round() as double;
                    });
                      }
                      )
                ],
              ),
            ),
          )),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight'.toUpperCase(),style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),),
                        Text('$weight',style: const TextStyle(fontSize: 40,
                            fontWeight: FontWeight.w900),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'decreaseWeight',
                              mini:true,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                            child: const Icon(Icons.remove),),
                            const SizedBox(width: 5,),
                            FloatingActionButton(
                              heroTag: 'increaseWeight',
                              mini:true,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            child: const Icon(Icons.add),)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[400]
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('AGE'.toUpperCase(),style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold
                        ),),
                        Text('$age',style: const TextStyle(fontSize: 40,
                            fontWeight: FontWeight.w900),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              heroTag: 'decreaseAge',
                              mini:true,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                            child: const Icon(Icons.remove),),
                            const SizedBox(width: 5,),
                            FloatingActionButton(
                              heroTag: 'increaseAge',
                              mini:true,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            child: const Icon(Icons.add),)
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
          Container(
            width: double.infinity,
            color: Colors.blue,
            height: 60,
            child: MaterialButton(
              onPressed: (){
                double res=weight/pow(height/100, 2);
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => BMIResultScreen(
                          age: age,
                          isFemale: isFemale,
                          res: res,
                        )
                    ));
              },
              child: const Text('CALCULATE',style: TextStyle(color: Colors.white,fontSize: 18),),
            ),
          )
        ],
      ),
    );
  }
}
