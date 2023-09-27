import 'dart:convert';
import 'dart:io';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:untitled22/example%20of%20delete%20data.dart';
import 'package:untitled22/screens/homescreen.dart';
import 'package:untitled22/screens/wish%20list%20screen.dart';
import 'package:untitled22/shread%20prefreance.dart';
import 'package:untitled22/state/product.dart';
import 'package:untitled22/swip%20button.dart';

import 'bloc.dart';
import 'combine object list.dart';
import 'curd operation use.dart';
import 'curdexample2.dart';
import 'data list.dart';
import 'dynamic ui.dart';
import 'dynamic widget.dart';
import 'example of store data.dart';
import 'getx.dart';

import 'hive/screens/info_screen.dart';
import 'list.dart';
import 'model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() async {
  // Initialize hive
  await Hive.initFlutter();
  // Registering the adapter
  //Hive.registerAdapter();
  // Opening the box
  await Hive.openBox('peopleBox');
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    // Closes all Hive boxes
    Hive.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home:MyHomePage99(),
    );
  }
}
