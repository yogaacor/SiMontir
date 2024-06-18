import 'package:flutter/material.dart';
import 'pesanmontir.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Si Montir',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PesanMontirPage(),
    );
  }
}
