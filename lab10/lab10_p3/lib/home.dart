import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../main.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Image(
              image: AssetImage("imgs/quiz.jpg"),
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Welcome to the Quiz App",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "By Manee Jaidee 645-28-5829",
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text("Start"),
            ),
          ],
        ),
      ),
    );
  }
}

class RestartButton extends StatelessWidget {
  const RestartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
        child: const Text("Restart"),
      )),
    );
  }
}
