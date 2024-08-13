import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/core/theming/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.mainBlue,
        title: const Text('home screen'),
      ),
    );
  }
}
