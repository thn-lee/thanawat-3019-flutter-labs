import 'package:flutter/material.dart';

class GuessWidget extends StatelessWidget {
  const GuessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: screenW <= 600
          ? AppBar(
              title: const Text(
                "Responsive and Layout Exercise",
              ),
            )
          : null,
      body: Column(
        children: [
          Expanded(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Text(
                    "Who's that pokemon?",
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: screenW <= 600 ? 30 : 24),
                  ),
                ),
                Image.network(
                  'https://www.outcyders.net/images/quizzes/4/question1.jpg',
                  width: screenW <= 600 ? 300 : 199,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Choices(choice: 'Thanapong', color: Colors.deepOrange),
                    Choices(choice: 'Tanawat', color: Colors.orange),
                  ],
                ),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Choices(choice: 'Tanadol', color: Colors.lightBlue),
                    Choices(choice: 'Thanawat', color: Colors.green),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Choices extends StatelessWidget {
  const Choices({Key? key, required this.choice, required this.color})
      : super(key: key);
  final String choice;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(10),
        color: color,
        child: Text(
          choice,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
