import 'package:blogclub/data.dart';
import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final items = AppDatabase.onBoardingItems;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 8),
                child: Assets.img.background.onboarding.image(),
              ),
            ),
            Column(
              children: [
                Container(
                  height: 260,
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 20,
                            color: Colors.black.withOpacity(0.1))
                      ],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      )),
                  child: Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          itemCount: items.length,
                          controller: _pageController,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(items[index].title,style: themeData.textTheme.headlineSmall,),
                                  SizedBox(height: 16,),
                                  Text(items[index].description,style: themeData.textTheme.titleSmall?.apply(fontSizeFactor: 0.8),),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        height: 60,
                        padding: const EdgeInsets.only(left: 32,right: 32,bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SmoothPageIndicator(
                              controller: _pageController,
                              count: items.length,
                              effect: ExpandingDotsEffect(
                                  dotWidth: 8,
                                  dotHeight: 8,
                                  activeDotColor: themeData.colorScheme.primary,
                                  dotColor: themeData.colorScheme.primary
                                      .withOpacity(0.2)),
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      themeData.primaryColor),
                                  minimumSize:
                                      WidgetStateProperty.all(Size(84, 60)),
                                  shape: WidgetStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12))),
                                ),
                                child: const Icon(
                                  CupertinoIcons.arrow_right,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
