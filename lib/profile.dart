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
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(32, 0, 32, 32),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: themeData.colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: themeData.colorScheme.onSurface.withOpacity(0.2),
                  ),
              ]
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Assets.img.stories.story8.image(width: 84,height: 84),
                    Expanded(
                      child: Column(
                        children: [
                          Text('@jovieden'),
                          Text('Jovi Daniel'),
                          Text('UX Designer'),
                        ],
                      ),
                    ),
                  ],
                ),
                Text('About me'),
                Text('Madison Blackstone is a director of user experience design, with experience managing global teams.'),
                

              ],
            ),
          ),
        ],
      ),
    );
  }
}
