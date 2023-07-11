import 'package:flutter/material.dart';
import 'package:nasa_workshop/core/resources/images.dart';
import 'package:nasa_workshop/core/theme/app_gaps.dart';
import 'package:nasa_workshop/core/widgets/buttons/rectangle_button_widget.dart';
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
            RectangleButtonWidget(callback: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ListPage()));
            })
          ],
        ),
      ),
    );
  }
}
