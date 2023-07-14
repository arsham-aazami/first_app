import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  int bmiResult = 0;

  String textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 8, 8, 8),
        appBar: AppBar(
          title: const Text("BMI Calculator",
              style: TextStyle(color: Color.fromARGB(255, 17, 212, 206))),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 40, 39, 39),
          elevation: 20.0,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
              width: double.infinity,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 70,
                  height: 60,
                  child: TextField(
                    controller: heightController,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 17, 212, 206)),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                          color: Color.fromARGB(255, 181, 180, 178)),
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 60,
                  child: TextField(
                      controller: weightController,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 17, 212, 206)),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 181, 180, 178)),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 80, width: double.infinity),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 8, 8, 8),
                ),
                onPressed: () {
                  double weight = double.parse(weightController.text);
                  double height = double.parse(heightController.text);
                  setState(() {
                    bmiResult = ((weight / pow(height, 2)) * 10000).ceil().toInt();
                    if (bmiResult < 18) {
                      textResult = "You are lower weight!";
                    } else if (bmiResult > 25) {
                      textResult = "You are over weight!";
                    }else{
                      textResult = "You have a normal BMI";
                    }
                  });
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                      color: Color.fromARGB(255, 17, 212, 206), fontSize: 30.0),
                )),
            const SizedBox(height: 30, width: double.infinity),
            Text(
              bmiResult.toString(),
              style: const TextStyle(
                  color: Color.fromARGB(255, 17, 212, 206), fontSize: 40.0),
            ),
            const SizedBox(height: 30, width: double.infinity),
            Visibility(
              visible: textResult.isNotEmpty,
              child: Text(
                textResult,
                style: const TextStyle(
                    color: Color.fromARGB(255, 17, 212, 206), fontSize: 35.0),
              ),
            ),
            const SizedBox(height: 100, width: double.infinity),
            const RightBar(barWidth: 50),
            const SizedBox(height: 30, width: double.infinity),
            const RightBar(barWidth: 100),
            const SizedBox(height: 30, width: double.infinity),
            const RightBar(barWidth: 50),
            const SizedBox(height: 30, width: double.infinity),
            const LeftBar(barWidth: 100),
            const SizedBox(height: 30, width: double.infinity),
            const LeftBar(barWidth: 50),
            const SizedBox(height: 30, width: double.infinity),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(230, 61, 165, 249)
              ),
              onPressed: (){}, child: Text("Navigate to another page"))
          ],
        ));
  }
}

class RightBar extends StatelessWidget {
  final double barWidth;
  const RightBar({super.key, required this.barWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: barWidth,
          height: 20,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
            color: Color.fromARGB(255, 17, 212, 206),
          ),
        )
      ],
    );
  }
}

class LeftBar extends StatelessWidget {
  final double barWidth;

  const LeftBar({super.key, required this.barWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: barWidth,
          height: 20,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            color: Color.fromARGB(255, 17, 212, 206),
          ),
        )
      ],
    );
  }
}
