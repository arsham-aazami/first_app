import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 8, 8),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 40, 39, 39),
        title: Text("Second Page"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 17, 212, 206)),
              onPressed: () => Navigator.pop(context),
              child: Text("Go Back"))
        ],
      ),
    );
  }
}
