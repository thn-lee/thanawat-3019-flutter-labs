import 'package:flutter/material.dart';
import 'package:lab10_p2/main.dart';
import '../component/question_component.dart';

class Question1 extends StatefulWidget {
  const Question1({
    Key? key,
  }) : super(key: key);

  @override
  _Question1State createState() => _Question1State();
}

class _Question1State extends State<Question1> {
  bool _active = false;
  int currentQuestion = 0;

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: screenW <= 600
          ? AppBar(
              title: Text(
                'Question ${currentQuestion + 1}',
              ),
            )
          : null,
      body: Column(
        children: [
          Expanded(child: AllQuestion[currentQuestion]),
          Container(
            margin: const EdgeInsets.all(20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: currentQuestion != 0,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentQuestion -= 1;
                      });
                    },
                    child: const Text('Previous'),
                  ),
                ),
                Visibility(
                  visible: true,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text('Home'),
                  ),
                ),
                Visibility(
                  visible: currentQuestion != AllQuestion.length - 1,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentQuestion++;
                      });
                    },
                    child: const Text('Next'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

var AllQuestion = [
  const QuestionComponent(
      picUrl: 'https://www.outcyders.net/images/quizzes/4/question1.jpg',
      correctAns: 1,
      choices: ['Tanadol', 'Thanawat', 'Tanawat', 'Thanapong'],
      question: "Who's that pokemon?"),
  const QuestionComponent(
      picUrl:
          'https://cdn.vox-cdn.com/thumbor/IhuPwFLVg19jF8B6rSmpy5T1-tY=/0x0:1920x1080/1400x788/filters:focal(807x387:1113x693):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/53254027/who_pokemon.0.jpg',
      correctAns: 4,
      choices: ['ธนาดล', 'ธนวรรธน์', 'ธนวัฒน์', 'ธนพงษ์'],
      question:
          "Who's our MAPP's TA with letter A as his first last name letter?"),
  const QuestionComponent(
      picUrl: 'https://pbs.twimg.com/media/Cw24H6MUQAE_wmG.png',
      correctAns: 3,
      choices: ['ทระนาดรล', 'ทระนะวรรทน์', 'ทระนะวรรท', 'ทระนะพรง'],
      question:
          "Who's our MAPP's TA with letter S as his first last name letter?")
];
