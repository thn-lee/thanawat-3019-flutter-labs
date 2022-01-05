import 'package:flutter/material.dart';
import './app_screens/text_styles.dart';
import './app_screens/widgets_demo.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Profile with Custom Text Style",
      // home: MyName(),
      home: Profile(),
    ),
  );
}
