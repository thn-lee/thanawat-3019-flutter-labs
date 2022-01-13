import 'package:flutter/material.dart';
import 'package:long_list/long_list.dart';
import 'package:long_list/fab_demo.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Basic List View Demo",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Widgets Exercise"),
        ),
        body: getListView(),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: const FABDemo(),
      ),
    ),
  );
}
