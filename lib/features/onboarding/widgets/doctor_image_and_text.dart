import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/styles.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/docdoc_logo_low_opacity.svg'),
        Container(
          child: Image.asset('assets/images/onboarding_doctor.png'),
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: const[.14,.4],
            ),
          ),
        ),
        Positioned(
          bottom: 30,
            right: 0,
            left: 0,
            child:Text(
              textAlign: TextAlign.center,
              'Best Doctor\nAppointment App',
              style: TextStyles.font32BlueBold.copyWith(
                height: 1.4,
              ),
            ) ),
      ],
    );
  }
}
