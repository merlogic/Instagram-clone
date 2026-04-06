import 'package:flutter/material.dart';
import '../../shared/widgets/post_card.dart';
import '../../models/post.dart';

class FeedScreen extends StatelessWidget {
  FeedScreen({super.key});

  final List<Post> dummyPosts = [
    Post(
      id: '1',
      username: 'katarinabluu',
      profileImage: 'assets/images/karina.jpg',
      postImage: 'assets/images/wave.jpg',
      caption: 'protecting my peace #aespa #Karina',
      likes: 51200,
      commentCount: 240,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      isLiked: true,
      isBookmarked: false,
    ),
    Post(
      id: '2',
      username: 'imwinter',
      profileImage: 'assets/images/winter.jpg',
      postImage: 'assets/images/nature.jpg',
      caption: 'life lately',
      likes: 38000,
      commentCount: 90,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      isLiked: false,
      isBookmarked: true,
      hashtags: ['Winter', 'Drama'],
    ),
  ];

  // Added '+' as the first element for the "Add Yours" button
  final List<String> Members = ['+', 'F1', 'The1975', 'Polcasan', 'BINI', 'le_sserafim', 'tripleS official'];

  final Map<String, String> MemberImages = {
    'F1': 'f1.jpg',
    'The1975': '1975.jpg',
    'Polcasan': 'Polcasan.jpg',
    'BINI': 'bini.jpg',
    'le_sserafim': 'le.jpg',
    'tripleS official': 'triple.jpg'
  };

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Instagram',
                  style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 32,
                    color: Colors.black,
                  ),
                ),
                if (!isWideScreen)
                  IconButton(
                    icon: const Icon(Icons.favorite_border, color: Colors.black),
                    onPressed: () {},
                  ),
              ],
            ),
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async => await Future.delayed(const Duration(seconds: 1)),
        color: Colors.black,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // 1. Stories Section
                SliverToBoxAdapter(
                  child: Container(
                    height: 115,
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey.shade200, width: 0.5)),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Members.length,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      itemBuilder: (context, index) => _buildStoryItem(index),
                    ),
                  ),
                ),
                // 2. Feed Posts
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => PostCard(post: dummyPosts[index]),
                    childCount: dummyPosts.length,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 100)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStoryItem(int index) {
    String name = Members[index];

    // Handle the "Add Yours" / Your Story button at index 0
    if (name == '+') {
      return Container(
        width: 80,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: Colors.grey[200],
                  backgroundImage: const AssetImage('assets/images/psyduck.jpg'), // Your profile pic
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                    child: const CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.add, size: 14, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'Your story',
              style: TextStyle(fontSize: 10, color: Colors.grey),
            ),
          ],
        ),
      );
    }

    // Regular Story Items
    String fileName = MemberImages[name] ?? 'default.jpg';
    return Container(
      width: 80,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(2.5),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [Color(0xFFf9ce34), Color(0xFFee2a7b), Color(0xFF6228d7)],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.grey[200],
                backgroundImage: AssetImage('assets/images/$fileName'),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            name,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}