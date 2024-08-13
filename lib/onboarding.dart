import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Assets.img.background.onboarding.image(),
        ],
      ),
    );
  }
}
