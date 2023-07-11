import 'package:flutter/material.dart';

class LoadingLinearIndicatorWidget extends StatelessWidget {
  const LoadingLinearIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LinearProgressIndicator(),
    );
  }
}
