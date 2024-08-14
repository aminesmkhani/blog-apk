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
          IconButton(onPressed: (){

          }, icon: Icon(Icons.more_horiz_rounded))
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32),
            child: Text('Four Things Every Woman Needs To Know',
              style: themeData.textTheme.headlineMedium,
            ),
          ),
        ],
      ),
    );
  }
}
