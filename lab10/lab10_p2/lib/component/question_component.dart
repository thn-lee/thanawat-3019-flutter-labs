import 'package:flutter/material.dart';

class QuestionComponent extends StatelessWidget {
  const QuestionComponent(
      {Key? key, this.picUrl, this.correctAns, this.choices, this.question})
      : super(key: key);

  final picUrl;
  final correctAns;
  final choices;
  final question;

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: screenW <= 600
                    ? const EdgeInsets.only(top: 0)
                    : const EdgeInsets.only(top: 40),
                child: Text(
                  question,
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: screenW <= 600 ? 24 : 16),
                ),
              ),
              Image.network(
                picUrl,
                width: screenW <= 600 ? 300 : 199,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: screenW <= 600
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Choices(
                      choice: choices[0],
                      color: Colors.amber.shade300,
                      isAnswer: correctAns == 1 ? true : false),
                  Choices(
                      choice: choices[1],
                      color: Colors.pink.shade300,
                      isAnswer: correctAns == 2 ? true : false)
                ],
              ),
              SizedBox(
                height: screenW <= 600 ? 60 : 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Choices(
                      choice: choices[2],
                      color: Colors.purple.shade300,
                      isAnswer: correctAns == 3 ? true : false),
                  Choices(
                      choice: choices[3],
                      color: Colors.deepPurple.shade300,
                      isAnswer: correctAns == 4 ? true : false)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Choices extends StatefulWidget {
  final String choice;
  Color color;
  final bool isAnswer;
  Choices({
    Key? key,
    required this.choice,
    required this.color,
    required this.isAnswer,
  }) : super(key: key);

  @override
  State<Choices> createState() => _ChoicesState();
}

class _ChoicesState extends State<Choices> {
  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;

    void _handleTap(bool isAnswer) {
      if (isAnswer) {
        print("correct");
        setState(() {
          widget.color = Colors.green;
        });
      } else if (!isAnswer) {
        print("incorrect");
        setState(() {
          widget.color = Colors.red;
        });
      }
    }

    return InkWell(
      onTap: () => _handleTap(widget.isAnswer),
      child: SizedBox(
        width: screenW <= 600 ? 125.0 : 250,
        height: screenW <= 600 ? 75.0 : 45,
        child: DecoratedBox(
          decoration: BoxDecoration(color: widget.color),
          child: Container(
            alignment: Alignment.center,
            padding: screenW <= 600
                ? const EdgeInsets.all(10)
                : const EdgeInsets.all(15),
            child: Text(
              widget.choice,
              textAlign: TextAlign.center,
              style: screenW <= 600
                  ? const TextStyle(fontSize: 18)
                  : const TextStyle(fontSize: 12),
            ),
          ),
        ),
      ),
    );
  }
}
