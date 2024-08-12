import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(
          child: Assets.img.background.splash.image(fit: BoxFit.cover),
          ),
          Center(child: Assets.img.icons.logo.svg(),
      ],),
    );
  }
}
