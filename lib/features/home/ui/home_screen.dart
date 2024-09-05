import 'package:flutter/material.dart';

import 'widgets/doctors_blue_container.dart';
import 'widgets/home_tap_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.fromLTRB(
            20,
            16,
            20,
            28,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeTapBar(),
              const DoctorsBlueContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
