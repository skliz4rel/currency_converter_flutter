import 'package:currency_converter/pages/currency_converter_cupertino_page.dart';
import 'package:currency_converter/pages/currency_converter_mate_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './pages/currency_converter_mate_page.dart'; //This is relative importing style

void main() {
  runApp(MyApp());
}

//Types of Widege
//Stateless Widget
//StatefulWidget
//InheritedWidgets

/*
State determins how a widget should  look like
or render or behaivour

State refers to data that would determine how the data woudl look like
  //some data that your widget woudl care about.

//In a statelessWidget, state (data) is immutable.
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const MaterialApp(home: CurrencyConverterMaterialPage());
    return const CupertinoApp(home: CurrencyConverterCupertinoPage());
  }
}

//Material design
// Cupertino design
