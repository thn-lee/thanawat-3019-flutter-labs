import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import './home.dart';

main() {
  runApp(
    MaterialApp(
      title: "My Questions",
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/second': (context) => const MyQuestions(),
        '/restart': (context) => const RestartButton(),
      },
    ),
  );
}

List<QuestionsItem> questions = [
  QuestionsItem(
    questionTitle: "Who's that pokemon?",
    pictureUrl: 'https://www.outcyders.net/images/quizzes/4/question1.jpg',
    choice1: 'Tanadol',
    choice2: 'Thanawat',
    choice3: 'Tanawat',
    choice4: 'Thanapong',
    answerChoice: 'Tanadol',
    currentIndex: 0,
    onNextQuestion: () {},
  ),
  QuestionsItem(
    questionTitle:
        "Who's our MAPP's TA with letter A as his first last name letter?",
    pictureUrl:
        'https://cdn.vox-cdn.com/thumbor/IhuPwFLVg19jF8B6rSmpy5T1-tY=/0x0:1920x1080/1400x788/filters:focal(807x387:1113x693):format(jpeg)/cdn.vox-cdn.com/uploads/chorus_image/image/53254027/who_pokemon.0.jpg',
    choice1: 'ธนาดล',
    choice2: 'ธนวรรธน์',
    choice3: 'ธนวัฒน์',
    choice4: 'ธนพงษ์',
    answerChoice: 'ธนพงษ์',
    currentIndex: 1,
    onNextQuestion: () {},
  ),
  QuestionsItem(
    questionTitle: 'Who is this in the picture?',
    pictureUrl: 'https://pbs.twimg.com/media/Cw24H6MUQAE_wmG.png',
    choice1: 'ทระนาดรล',
    choice2: 'ทระนะวรรทน์',
    choice3: 'ทระนะวรรท',
    choice4: 'ทระนะพรง',
    answerChoice: 'ทระนะวรรท',
    currentIndex: 2,
    onNextQuestion: () {},
  ),
];

class Pictures extends StatelessWidget {
  final String url;
  const Pictures({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(url),
      height: 100,
      width: 250,
    );
  }
}

class MyQuestions extends StatefulWidget {
  const MyQuestions({Key? key}) : super(key: key);

  @override
  State<MyQuestions> createState() => _MyQuestionsState();
}

class _MyQuestionsState extends State<MyQuestions> {
  @override
  Widget build(BuildContext context) {
    return Questions(
      questionItem: questions,
    );
  }
}

class Questions extends StatefulWidget {
  final List<QuestionsItem> questionItem;
  const Questions({Key? key, required this.questionItem}) : super(key: key);

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  int currentIndex = 0;

  void onPreviousQuestion() {
    setState(
      () => {
        currentIndex--,
      },
    );
  }

  void onNextQuestion() {
    setState(
      () => {
        currentIndex++,
        if (currentIndex == 3)
          {
            Navigator.pushNamed(context, '/restart'),
          },
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter project',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Question ${currentIndex + 1}'),
        ),
        body: Column(children: [
          Expanded(
            child: widget.questionItem.map((question) {
              question.onNextQuestion = onNextQuestion;
              return question;
            }).toList()[currentIndex],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  child: ElevatedButton(
                    child: const Text('Previous'),
                    onPressed: onPreviousQuestion,
                  ),
                  visible: currentIndex >= 1 ? true : false,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text("Home"),
                ),
                Visibility(
                  maintainSize: true,
                  maintainState: true,
                  maintainAnimation: true,
                  child: ElevatedButton(
                    child: const Text('Next'),
                    onPressed: onNextQuestion,
                  ),
                  visible:
                      currentIndex <= widget.questionItem.length ? true : false,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ]),
      ),
    );
  }
}

class QuestionsItem extends StatefulWidget {
  final String questionTitle,
      pictureUrl,
      choice1,
      choice2,
      choice3,
      choice4,
      answerChoice;
  final int currentIndex;
  Function onNextQuestion;
  QuestionsItem(
      {Key? key,
      required this.questionTitle,
      required this.pictureUrl,
      required this.choice1,
      required this.choice2,
      required this.choice3,
      required this.choice4,
      required this.answerChoice,
      required this.currentIndex,
      required this.onNextQuestion})
      : super(key: key);

  @override
  State<QuestionsItem> createState() => _QuestionsItemState();
}

class _QuestionsItemState extends State<QuestionsItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                child: Text(
                  widget.questionTitle,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    fontFamily: 'Mali',
                    fontSize: 30.0,
                    // fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
              Expanded(
                child: Pictures(url: widget.pictureUrl),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: ChoiceNCheck(
                        name: widget.choice1,
                        color: Colors.blue,
                        isAnswer: widget.answerChoice == widget.choice1
                            ? true
                            : false,
                        currentIndex: widget.currentIndex,
                        onNextQuestion: widget.onNextQuestion,
                      ),
                    ),
                    Expanded(
                      child: ChoiceNCheck(
                        name: widget.choice2,
                        color: Colors.purple,
                        isAnswer: widget.answerChoice == widget.choice2
                            ? true
                            : false,
                        currentIndex: widget.currentIndex,
                        onNextQuestion: widget.onNextQuestion,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: ChoiceNCheck(
                        name: widget.choice3,
                        color: Colors.pinkAccent,
                        isAnswer: widget.answerChoice == widget.choice3
                            ? true
                            : false,
                        currentIndex: widget.currentIndex,
                        onNextQuestion: widget.onNextQuestion,
                      ),
                    ),
                    Expanded(
                      child: ChoiceNCheck(
                        name: widget.choice4,
                        color: Colors.orange,
                        isAnswer: widget.answerChoice == widget.choice4
                            ? true
                            : false,
                        currentIndex: widget.currentIndex,
                        onNextQuestion: widget.onNextQuestion,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void _showDialog(
    BuildContext context, int index, Function onNext, bool isAnswer) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Score!"),
        content: isAnswer
            ? const Text("Congrats, you get 1 point")
            : const Text("Sorry, you miss it!"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              index == (questions.length - 1)
                  ? Navigator.pushNamed(context, '/restart')
                  : onNext();
            },
            child: const Text("OK!"),
          ),
        ],
      );
    },
  );
}

class ChoiceNCheck extends StatefulWidget {
  final String name;
  Color color;
  final bool isAnswer;
  int currentIndex;
  final Function onNextQuestion;
  ChoiceNCheck(
      {Key? key,
      required this.name,
      required this.color,
      required this.isAnswer,
      required this.currentIndex,
      required this.onNextQuestion})
      : super(key: key);

  @override
  State<ChoiceNCheck> createState() => _ChoiceNCheckState();
}

class _ChoiceNCheckState extends State<ChoiceNCheck> {
  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;

    void _handleTap(bool isAnswer) {
      _showDialog(
          context, widget.currentIndex, widget.onNextQuestion, isAnswer);
      if (isAnswer) {
        setState(() {
          widget.color = Colors.green;
        });
      } else if (!isAnswer) {
        setState(() {
          widget.color = Colors.red;
        });
      }
    }

    return InkWell(
      onTap: () => _handleTap(widget.isAnswer),
      child: Container(
        width: 20,
        margin: const EdgeInsets.all(10),
        child: SizedBox(
          width: screenW <= 600 ? 75 : 150,
          height: screenW <= 600 ? 80 : 75,
          child: DecoratedBox(
            decoration: BoxDecoration(color: widget.color),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                widget.name,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
