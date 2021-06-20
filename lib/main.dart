import 'package:flutter/material.dart';
import 'package:instagramui/screens/root_screen.dart';
import 'package:instagramui/theme/colors.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    color: black,
    theme: ThemeData.light(),
    home: RootApp(),
  ));
}

