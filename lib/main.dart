import 'package:flutter/material.dart';
import 'package:fm_ms_app/presentation/screens/radio_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FM Monte Santo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: RadioPlayer()
    );
  }
}
