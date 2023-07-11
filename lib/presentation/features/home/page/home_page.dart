import 'package:flutter/material.dart';
import 'package:nasa_workshop/core/constants/text_constants.dart';
import 'package:nasa_workshop/core/resources/images.dart';
import 'package:nasa_workshop/core/theme/app_colors.dart';
import 'package:nasa_workshop/core/theme/app_gaps.dart';
import 'package:nasa_workshop/core/theme/app_text_style.dart';
import 'package:nasa_workshop/presentation/features/home/page/list_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: const AlwaysStoppedAnimation<double>(1.0),
              child: Image.asset(Images.nasaLogo, width: 300),
            ),
            AppGaps.s03,
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ListPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: AppColors.bleuFonce3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(TextConstants.startButtonLabel, style: AppTextStyles.boldButton),
            ),
          ],
        ),
      ),
    );
  }
}
