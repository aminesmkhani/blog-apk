import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Assets.img.icons.logo.svg(),
            Container(
              decoration: BoxDecoration(
                color: themeData.
                colorScheme.primary,
                
                ),
            ),
          ],
        ),
      ),
    );
  }
}
