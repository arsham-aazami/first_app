import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  String? first_name;
  String? last_name;

  SecondPage(this.first_name, this.last_name, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 8, 8),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 40, 39, 39),
        title: const Text("Second Page"),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 300,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 17, 212, 206)),
                onPressed: () => Navigator.pop(context),
                child: const Text("Go Back")),
            Text(
              "$first_name $last_name you will have a muscular body by the end of this year",
              style: const TextStyle(color: Color.fromARGB(255, 17, 212, 206)),
            ),
          ],
        ),
      ),
    );
  }
}
