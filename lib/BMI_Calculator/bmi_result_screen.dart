import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  final double res;
  final bool? isFemale;
  final double age;

  const BMIResultScreen({super.key, required this.age,required this.isFemale,required this.res});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('BMI Result')),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_sharp),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isFemale==true?'Gender : Female':'Gender : Male',style: const TextStyle(
              fontSize: 25,fontWeight: FontWeight.bold
            ),),
            Text('Age : $age',style: const TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold
            ),),
            Text('Result : ${res.round()}',style: const TextStyle(
                fontSize: 25,fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }
}
