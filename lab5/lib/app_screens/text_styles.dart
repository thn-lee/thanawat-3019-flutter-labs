import 'package:flutter/material.dart';

class MyName extends StatelessWidget {
  const MyName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(40),
        margin: const EdgeInsets.all(40),
        color: Colors.purple,
        child: const Text(
          'ธนวรรธน์ ลีลาวัชรมาศ',
          textDirection: TextDirection.ltr,
          style: TextStyle(
            color: Colors.yellowAccent,
            decoration: TextDecoration.none,
            fontFamily: 'rataphan2498',
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
