import 'package:flutter/material.dart';
import 'package:flutter_imt_indeks_massa_tubuh/imt_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"Indeks Massa Tubuh",
      home: IMTscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
