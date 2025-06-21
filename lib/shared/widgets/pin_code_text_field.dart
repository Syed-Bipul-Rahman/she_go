import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../theme/app_colors.dart';

class CustomPinCodeTextField extends StatelessWidget {
  const CustomPinCodeTextField({super.key, this.textEditingController});

  final TextEditingController? textEditingController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      backgroundColor: Colors.transparent,
      cursorColor: AppColors.primary,
      controller: textEditingController,
      textStyle: TextStyle(color: AppColors.primary),
      autoFocus: false,
      appContext: context,
      length: 6,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(4),
        selectedColor: AppColors.primary,
        activeFillColor: Colors.grey,
        selectedFillColor: Colors.grey,
        inactiveFillColor: Colors.grey,
        fieldHeight: 52,
        fieldWidth: 52,
        inactiveColor: Colors.grey,
        activeColor: AppColors.primary,
      ),
      obscureText: false,
      keyboardType: TextInputType.number,
      onChanged: (value) {},
    );
  }
}
