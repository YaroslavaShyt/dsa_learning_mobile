import 'package:dsa_learning/presentation/widgets/main_background.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MainBackground(),
          Center(
          child: Text('HOME'),
        ),],
      ),
    );
  }
}
