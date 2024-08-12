import 'package:blogclub/data.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const defaultFontFamily = 'Avenir';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final primaryTextColor = Color(0xff0D253C);
    final secondaryTextColor = Color(0xff2D4379);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        textTheme: TextTheme(
          titleMedium: TextStyle(
              fontFamily: defaultFontFamily,
              color: secondaryTextColor,
              fontWeight: FontWeight.w200,
              fontSize: 18),
          titleLarge: TextStyle(
            fontFamily: defaultFontFamily,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: primaryTextColor,
          ),
          titleSmall: TextStyle(
              fontFamily: defaultFontFamily,
              color: primaryTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 14),
          bodyMedium: TextStyle(
            fontFamily: defaultFontFamily,
            color: secondaryTextColor,
            fontSize: 12,
          ),
          headlineMedium: TextStyle(
              fontFamily: defaultFontFamily,
              fontSize: 24,
              color: primaryTextColor,
              fontWeight: FontWeight.w700),
          headlineSmall: TextStyle(
              fontFamily: defaultFontFamily,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: primaryTextColor),
        ),
        useMaterial3: true,
      ),
      home: Stack(children: [
        const Positioned.fill(child: HomeScreen()),
        Positioned(bottom: 0, right: 0, left: 0, child: _BottomNavigation())
      ]),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Amin',
                      style: themeData.textTheme.titleMedium,
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 16),
                child: Text('Explore today’s',
                    style: themeData.textTheme.headlineMedium),
              ),
              _StoryList(stories: stories),
              const _CategoryList(),
              const _PostList(),
              SizedBox(
                height: 32,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
        itemCount: categories.length,
        itemBuilder: (context, index, realIndex) {
          return _Category(
            left: realIndex == 0 ? 32 : 8,
            right: realIndex == categories.length - 1 ? 32 : 8,
            category: categories[realIndex],
          );
        },
        options: CarouselOptions(
            scrollDirection: Axis.horizontal,
            viewportFraction: 0.8,
            aspectRatio: 1.2,
            initialPage: 0,
            scrollPhysics: const BouncingScrollPhysics(),
            disableCenter: false,
            enableInfiniteScroll: false,
            padEnds: false,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height));
  }
}

class _Category extends StatelessWidget {
  final Category category;
  final double left;
  final double right;
  const _Category({
    super.key,
    required this.category,
    required this.left,
    required this.right,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
          Positioned.fill(
              top: 100,
              right: 65,
              left: 65,
              bottom: 24,
              child: Container(
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(blurRadius: 20, color: Color(0xaa0D253C)),
                ]),
              )),
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(32)),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      colors: [Color(0xff0D253C), Colors.transparent])),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32),
                child: Image.asset(
                  'assets/img/posts/large/${category.imageFileName}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 48,
            left: 32,
            child: Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .apply(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    super.key,
    required this.stories,
  });

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 100,
      child: ListView.builder(
          itemCount: stories.length,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          itemBuilder: (context, index) {
            final story = stories[index];
            return _Story(story: story);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    super.key,
    required this.story,
  });

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4, 2, 4, 0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _profileImageViewed() : _profileImageNormal(),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Image.asset(
                    'assets/img/icons/${story.iconFileName}',
                    width: 24,
                    height: 24,
                  )),
            ],
          ),
          const SizedBox(height: 4),
          Text(story.name),
        ],
      ),
    );
  }

  Container _profileImageNormal() {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            colors: [Color(0xff376AED), Color(0xff49B0E2), Color(0xff9CECFB)]),
      ),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
        ),
        padding: const EdgeInsets.all(5),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed() {
    return SizedBox(
      width: 68,
      height: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        strokeWidth: 2,
        radius: const Radius.circular(24),
        color: const Color(0xff7B8BB2),
        dashPattern: const [8.3],
        padding: const EdgeInsets.all(7),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
        borderRadius: BorderRadius.circular(17),
        child: Image.asset('assets/img/stories/${story.imageFileName}'));
  }
}

class _PostList extends StatelessWidget {
  const _PostList({super.key});
  @override
  Widget build(BuildContext context) {
    final posts = AppDatabase.posts;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 32, right: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Latest News',
                  style: Theme.of(context).textTheme.headlineSmall),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'More',
                  style: TextStyle(color: Color(0xff376AED)),
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
            itemCount: posts.length,
            itemExtent: 141,
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              final post = posts[index];
              return _Post(post: post);
            }),
      ],
    );
  }
}

class _Post extends StatelessWidget {
  const _Post({
    super.key,
    required this.post,
  });

  final PostData post;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(32, 8, 32, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            blurRadius: 10,
            color: Color(0x1a5282ff),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset('assets/img/posts/small/${post.imageFileName}'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post.caption,
                    style: const TextStyle(
                        fontFamily: MyApp.defaultFontFamily,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        color: Color(0xff376AED)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(post.title,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Icon(CupertinoIcons.hand_thumbsup,
                          size: 16,
                          color: Theme.of(context).textTheme.bodyMedium!.color),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(post.likes,
                          style: Theme.of(context).textTheme.bodyMedium),
                      const SizedBox(
                        width: 16,
                      ),
                      Icon(CupertinoIcons.clock,
                          size: 16,
                          color: Theme.of(context).textTheme.bodyMedium!.color),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(post.time,
                          style: Theme.of(context).textTheme.bodyMedium),
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: Icon(
                              post.isBookmarked
                                  ? CupertinoIcons.bookmark_fill
                                  : CupertinoIcons.bookmark,
                              size: 16,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: const BoxDecoration(color: Colors.white,boxShadow:[
                BoxShadow(
                  blurRadius:20,
                  color: Color(0xaa9b8487),
                  ),
                  ]
                   ),
            ),
          ),
          Center(
            child: Container(
              width: 65,
              height: 85,
              alignment: Alignment.topCenter,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  color: const Color(0xff376AED),
                ),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
