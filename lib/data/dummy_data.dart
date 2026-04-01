import '../models/post.dart';

class DummyData {
  static List<Post> dummyPosts = [
    Post(
      id: '1',
      username: 'katarinabluu',
      // Pointing to your local assets
      profileImage: 'assets/images/karina.jpg', 
      postImage: 'assets/images/wave.jpg',
      caption: 'SYNK HYPER LINE 🌙✨ #aespa #Karina',
      likes: 450200,
      commentCount: 1240,
      createdAt: DateTime.now().subtract(const Duration(hours: 2)),
      isLiked: true,
      isBookmarked: false,
      hashtags: ['aespa', 'Karina', 'SYNK'],
    ),
    Post(
      id: '2',
      username: 'imwinter',
      profileImage: 'assets/images/winter.jpg',
      postImage: 'assets/images/nature.jpg',
      caption: 'Drama-ma-ma-ma ❄️',
      likes: 380100,
      commentCount: 890,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
      isLiked: false,
      isBookmarked: true,
      hashtags: ['Winter', 'Drama'],
    ),
    Post(
      id: '3',
      username: 'imnotningning',
      profileImage: 'assets/images/ningning.jpg',
      postImage: 'assets/images/coffee.jpg',
      caption: 'Morning coffee and stage vibes ☕️🦋',
      likes: 310500,
      commentCount: 2100,
      createdAt: DateTime.now().subtract(const Duration(hours: 8)),
      isLiked: false,
      isBookmarked: false,
      hashtags: ['Ningning', 'Aespa_Savage'],
    ),
    Post(
      id: '4',
      username: 'aerichandesu',
      profileImage: 'assets/images/giselle.jpg',
      // You can reuse nature or wave if you don't have a 4th post image yet
      postImage: 'assets/images/nature.jpg', 
      caption: 'That’s my girl! ✨ @imnotningning',
      likes: 290000,
      commentCount: 450,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      isLiked: false,
      isBookmarked: false,
      hashtags: ['Giselle', 'Aespa'],
    ),
  ];

  static List<String> aespaMembers = [
    'Karina', 
    'Winter', 
    'Giselle', 
    'Ningning', 
    'aespa', 
    'MY'
  ];
}