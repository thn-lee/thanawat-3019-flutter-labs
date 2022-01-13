import 'package:flutter/material.dart';
import 'package:long_list/long_list.dart';

class FABDemo extends StatefulWidget {
  const FABDemo({Key? key}) : super(key: key);

  @override
  _FABDemoState createState() => _FABDemoState();
}

class _FABDemoState extends State<FABDemo> {
  int addedItems = getListElements().length;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      // backgroundColor: Colors.deepOrange,
      onPressed: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Current number of problems is ${addedItems + 1}."),
          ),
        );
        setState(
          () {
            addedItems++;
          },
        );
      },
      child: const Icon(Icons.add),
      tooltip: "press to add one more items.",
    );
  }
}
