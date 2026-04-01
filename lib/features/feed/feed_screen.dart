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
    Post(
      id: '3',
      username: 'aerichandesu',
      profileImage: 'assets/images/giselle.jpg',
      postImage: 'assets/images/coffee.jpg',
      caption: 'Spanish latte is the best',
      likes: 4500,
      commentCount: 200,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      isLiked: false,
      isBookmarked: false,
      hashtags: ['Giselle', 'Aespa'],
    ),
  ];

  final List<String> Members = ['The1975', 'Polcasan', 'BINI', 'le_sserafim','tripleS official'];
  
  final Map<String, String> MemberImages = {
    'The1975': '1975.jpg',
    'Polcasan': 'Polcasan.jpg',
    'BINI': 'bini.jpg',
    'le_sserafim': 'le.jpg',
    'tripleS official' :'triple.jpg'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Instagram',
          style: TextStyle(
            fontFamily: 'Billabong', 
            fontSize: 32, 
            color: Colors.black
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black), 
            onPressed: () {}
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => await Future.delayed(const Duration(seconds: 1)),
        color: Colors.black,
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
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
                  // Updated to pass the context and index properly
                  itemBuilder: (context, index) => _buildStoryItem(index),
                ),
              ),
            ),
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
    );
  }

  Widget _buildStoryItem(int index) {
    String displayName = Members[index];
    
    String fileName = MemberImages[displayName] ?? 'default.jpg';
    
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
                colors: [Color(0xFF000000), Color(0xFF632890), Color(0xFF00D1FF)],
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
                // Updated logic to use the mapped fileName
                backgroundImage: AssetImage('assets/images/$fileName'),
                onBackgroundImageError: (exception, stackTrace) {
                  debugPrint('Missing image for $fileName');
                },
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            displayName,
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}