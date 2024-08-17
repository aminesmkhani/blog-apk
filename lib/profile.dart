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
          IconButton(icon: Icon(Icons.more_horiz_rounded), onPressed: () { 

          },),
          SizedBox(
            width: 16,
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(32, 0, 32, 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: themeData.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: themeData.colorScheme.onSurface.withOpacity(0.1),
                  ),
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                  child: Row(
                    children: [
                      ClipRRect(borderRadius:BorderRadius.circular(12) ,child: Assets.img.stories.story8.image(width: 84,height: 84)),
                      SizedBox(width: 16,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('@jovieden'),
                            SizedBox(
                              height: 4,
                            ),
                            Text('Jovi Daniel',style: themeData.textTheme.bodyLarge,),
                            SizedBox(height: 6,),
                            Text('UX Designer',style: themeData.textTheme.bodyLarge!.apply(color: themeData.colorScheme.primary),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(32, 0, 32, 4),
                  child: Text('About me',style: themeData.textTheme.headlineSmall,),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(32, 4, 32, 32),
                  child: Text('Madison Blackstone is a director of user experience design, with experience managing global teams.',
                  style: themeData.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w200),
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
