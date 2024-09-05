import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/core/helpers/spacing.dart';
import 'package:flutter_advanced_app/features/home/ui/widgets/doctors_list/doctors_list_view.dart';
import 'package:flutter_advanced_app/features/home/ui/widgets/doctors_speciality_see_all.dart';
import 'package:flutter_advanced_app/features/home/ui/widgets/specializations_list/speciality_list_view.dart';

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
              verticalSpace(24.0),
              const DoctorsSpecialitySeeAll(),
              verticalSpace(16),
              const SpecialityListView(),
              verticalSpace(8),
              const DoctorsListView(),
            ],
          ),
        ),
      ),
    );
  }
}
