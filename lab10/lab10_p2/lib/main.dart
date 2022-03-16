import 'package:flutter/material.dart';
import 'app_screens/guess_where.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => const HomePage(),
        '/second': (context) => const Question1(),
      },
    ),
  );
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Image(
              image: AssetImage('imgs/quiz.jpg'),
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Welcome to the Quiz App'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'By Manee Jaidee 645-28-5829',
            ),
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/second');
                },
                child: const Text('Start'))
          ],
        ),
      ),
    );
  }
}
