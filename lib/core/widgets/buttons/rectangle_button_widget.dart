import 'package:flutter/material.dart';
import 'package:nasa_workshop/core/constants/text_constants.dart';
import 'package:nasa_workshop/core/theme/app_colors.dart';
import 'package:nasa_workshop/core/theme/app_text_style.dart';

class RectangleButtonWidget extends StatelessWidget {
  const RectangleButtonWidget({super.key, required this.callback});

  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        callback();
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        backgroundColor: AppColors.bleuFonce3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: const Text(TextConstants.startButtonLabel, style: AppTextStyles.boldButton),
    );
  }
}
