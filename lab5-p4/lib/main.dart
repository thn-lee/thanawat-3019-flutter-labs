import 'package:flutter/material.dart';
import 'package:basic_list_view/basic_list_view.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Basic List View Demo",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Widgets Exercise"),
        ),
        body: const BasicListView(),
      ),
    ),
  );
}
