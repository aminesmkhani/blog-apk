import 'package:blogclub/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeData.colorScheme.surface.withOpacity(0),
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz_rounded),
            onPressed: () {},
          ),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(32, 0, 32, 64),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: themeData.colorScheme.surface,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 20,
                        color: themeData.colorScheme.onSurface.withOpacity(0.1),
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                      child: Row(
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Assets.img.stories.story8
                                  .image(width: 84, height: 84)),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('@jovieden'),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  'Jovi Daniel',
                                  style: themeData.textTheme.bodyLarge,
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'UX Designer',
                                  style: themeData.textTheme.bodyLarge!.apply(
                                      color: themeData.colorScheme.primary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(32, 0, 32, 4),
                      child: Text(
                        'About me',
                        style: themeData.textTheme.headlineSmall,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(32, 4, 32, 32),
                      child: Text(
                        'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                        style: themeData.textTheme.bodyLarge!
                            .copyWith(fontWeight: FontWeight.w200),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 32,
                left: 96,
                right: 96,
                child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 30,
                          color:
                              themeData.colorScheme.onSurface.withOpacity(0.8)),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 32,
                left: 64,
                right: 64,
                child: Container(
                  height: 68,
                  decoration: BoxDecoration(
                      color: themeData.colorScheme.primary,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xff2151CD),
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '52',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: themeData.colorScheme.onPrimary),
                              ),
                              Text(
                                'Post',
                                style: themeData.textTheme.bodyMedium!.copyWith(
                                    color: themeData.colorScheme.onPrimary,
                                    fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '250',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: themeData.colorScheme.onPrimary),
                            ),
                            Text(
                              'Following',
                              style: themeData.textTheme.bodyMedium!.copyWith(
                                  color: themeData.colorScheme.onPrimary,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '4.5 K',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: themeData.colorScheme.onPrimary),
                            ),
                            Text(
                              'Followers',
                              style: themeData.textTheme.bodyMedium!.copyWith(
                                  color: themeData.colorScheme.onPrimary,
                                  fontWeight: FontWeight.w200),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
                color: themeData.colorScheme.surface,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'My Posts',
                          style: themeData.textTheme.headlineSmall,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Assets.img.icons.grid.svg(),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Assets.img.icons.table.svg(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
