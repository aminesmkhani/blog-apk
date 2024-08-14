import 'dart:math';

import 'package:blogclub/gen/assets.gen.dart';
import 'package:blogclub/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
        color: themeData.colorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.bold);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 30),
              child: Assets.img.icons.logo.svg(width: 110),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32)),
                  color: themeData.colorScheme.primary,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Login'.toUpperCase(),
                            style: tabTextStyle,
                          ),
                          Text(
                            'Register'.toUpperCase(),
                            style: tabTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32)),
                            color: themeData.colorScheme.surface),
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Welcome Back',
                                    style: themeData.textTheme.headlineMedium),
                                const SizedBox(
                                  height: 12,
                                ),
                                Text(
                                  'Sign in with your account',
                                  style: themeData.textTheme.titleMedium!
                                      .apply(fontSizeFactor: 0.8),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                const TextField(
                                  decoration:
                                      InputDecoration(label: Text('UserName')),
                                ),
                                const PasswordTextField(),
                                const SizedBox(
                                  height: 24,
                                ),
                                ElevatedButton(
                                    style: ButtonStyle(
                                      minimumSize: WidgetStateProperty.all(
                                        Size(MediaQuery.of(context).size.width,
                                            60),
                                      ),
                                      shape: WidgetStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                      ),
                                      backgroundColor: WidgetStateProperty.all(
                                          themeData.primaryColor),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Login'.toUpperCase(),
                                      style: const TextStyle(
                                        fontFamily: FontFamily.avenir,
                                        color: Colors.white,
                                      ),
                                    )),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'Forgot your password?',
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text('Reset Here')),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                const Center(
                                  child: Text('OR SIGN IN WITH',
                                      style: TextStyle(letterSpacing: 2)),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Assets.img.icons.google
                                        .image(width: 36, height: 36),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Assets.img.icons.facebook
                                        .image(width: 36, height: 36),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Assets.img.icons.twitter
                                        .image(width: 36, height: 36),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  var obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obsecureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: const Text('Password'),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obsecureText = !obsecureText;
            });
          },
          child: Text(
            obsecureText? 'Show':'Hide',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.primary
            ),
         ),
        ),
      ),
    );
  }
}
