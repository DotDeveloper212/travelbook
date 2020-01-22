import 'package:flutter/material.dart';
import 'package:FluttTrav_Booking/pages/page_home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FluttTrav Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(titre: 'FluttTrav Booking'),
    );
  }
}