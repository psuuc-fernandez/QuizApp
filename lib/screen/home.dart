import 'package:fernandezassignment3/components/questions.dart';
import 'package:fernandezassignment3/components/title_home.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool toPlay = false;

  void startPlay() {
    setState(() {
      toPlay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB0E0E6),
      body: toPlay ? Questions() : TitleHome(startPlay),
    );
  }
}
