import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget{
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      elevation: 0,
      title: Text('Profile'),
      actions: [
        Icon(Icons.more_horiz_rounded),
        SizedBox(width: 16,)
      ],
    ),
    body: Column(
      children: [
        
      ],
    ),
   );
  }
}