import 'package:flutter/material.dart';
import 'package:flutter_advanced_app/core/helpers/spacing.dart';
import 'package:flutter_advanced_app/core/theming/colors.dart';
import 'package:flutter_advanced_app/core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCharacters,
      required this.hasNumber,
      required this.hasMinLength});
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow(
            'At least 1 special characters', hasSpecialCharacters),
        verticalSpace(2),
        buildValidationRow('At least 1 Number', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 1 character long ', hasMinLength),
        verticalSpace(2),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(text,
            style: TextStyles.font13DarkBlueRegular.copyWith(
              decoration: hasValidated ? TextDecoration.lineThrough : null,
              decorationColor: Colors.green,
              decorationThickness: 2,
              color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
            )),
      ],
    );
  }
}
