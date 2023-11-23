import 'package:flutter/material.dart';

import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      home: PriceScreen(),
    );
  }
}

class fdf extends StatefulWidget {
  const fdf({super.key});

  @override
  State<fdf> createState() => _fdfState();
}

class _fdfState extends State<fdf> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
