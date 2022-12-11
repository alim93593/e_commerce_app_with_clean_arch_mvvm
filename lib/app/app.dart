// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/theme_manager.dart';


class MyApp extends StatefulWidget {
  // const MyApp({Key? key}) : super(key: key);  /// default constructor
  MyApp._internal();  /// named constructor
  static final MyApp _instance=  MyApp._internal();/// singleton or single instance
  factory MyApp()=>_instance;////factory
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
    );
  }
}
