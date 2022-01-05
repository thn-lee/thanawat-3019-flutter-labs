import 'package:flutter/material.dart';

void main() {
  runApp(
    const ItemCounter(
      name: "Item Counter Demo",
    ),
  );
}

class ItemCounter extends StatefulWidget {
  const ItemCounter({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  _ItemCounterState createState() => _ItemCounterState();
}

class _ItemCounterState extends State<ItemCounter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.yellow,
        appBarTheme: const AppBarTheme(color: Colors.purple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.name),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                count++;
              });
            },
            child: Text(
              '$count',
              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
