import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz_rounded)),
          const SizedBox(
            width: 16,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
            child: Text(
              'Four Things Every Woman Needs To Know',
              style: themeData.textTheme.headlineMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 32, bottom: 32),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Assets.img.stories.story9
                      .image(width: 48, height: 48, fit: BoxFit.cover),
                ),
                const SizedBox(
                  width: 16,
                ),
                 Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Richard Geravin',
                        style: themeData.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400)
                        ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text('2m ago'),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(CupertinoIcons.bookmark),
                  color: themeData.colorScheme.primary,
                ),
                IconButton(
                  onPressed: (){},
                  icon: Icon(CupertinoIcons.share),
                  color: themeData.colorScheme.primary,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
