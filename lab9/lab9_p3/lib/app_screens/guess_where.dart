import 'package:flutter/material.dart';

class ChoicesWidget extends StatefulWidget {
  const ChoicesWidget({
    Key? key,
  }) : super(key: key);

  @override
  _ChoicesWidgetState createState() => _ChoicesWidgetState();
}

class _ChoicesWidgetState extends State<ChoicesWidget> {
  bool _active = false;

  void _handleChoicesChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

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
              crossAxisAlignment: CrossAxisAlignment.center,
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
              mainAxisAlignment: screenW <= 600
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Choices(
                        choice: 'Thanapong',
                        color: Colors.amber.shade300,
                        isAnswer: false),
                    Choices(
                        choice: 'Tanawat',
                        color: Colors.pink.shade300,
                        isAnswer: false)
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
                        choice: 'Tanadol',
                        color: Colors.purple.shade300,
                        isAnswer: false),
                    Choices(
                        choice: 'Thanawat',
                        color: Colors.deepPurple.shade300,
                        isAnswer: true)
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
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(milliseconds: 1100),
            content: Text('Your Score is 1'),
          ),
        );
      } else if (!isAnswer) {
        print("incorrect");
        setState(() {
          widget.color = Colors.red;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            duration: Duration(milliseconds: 1100),
            content: Text('Your Score is 0'),
          ),
        );
      }
    }

    return InkWell(
      onTap: () => _handleTap(widget.isAnswer),
      child: SizedBox(
        width: screenW <= 600 ? 125.0 : 250,
        height: screenW <= 600 ? 75.0 : 50,
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
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }
}
