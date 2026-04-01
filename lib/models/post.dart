class Post {
  final String id;
  final String username;
  final String profileImage;
  final String postImage;
  final String caption;
  final int likes;
  final int commentCount;
  final DateTime createdAt;
  final bool isLiked;
  final List<String> hashtags;
  // Added: To support saving/bookmarking logic later
  final bool isBookmarked; 

  Post({
    required this.id,
    required this.username,
    required this.profileImage,
    required this.postImage,
    required this.caption,
    required this.likes,
    this.commentCount = 0,
    required this.createdAt,
    this.isLiked = false,
    this.isBookmarked = false,
    this.hashtags = const [],
  });

  // 1. Convert Supabase/JSON data into a Post object
  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] ?? '',
      username: json['username'] ?? '',
      profileImage: json['profile_image'] ?? '',
      postImage: json['post_image'] ?? '',
      caption: json['caption'] ?? '',
      likes: json['likes'] ?? 0,
      commentCount: json['comment_count'] ?? 0,
      createdAt: DateTime.parse(json['created_at']),
      isLiked: json['is_liked'] ?? false,
      isBookmarked: json['is_bookmarked'] ?? false,
      hashtags: List<String>.from(json['hashtags'] ?? []),
    );
  }

  // 2. Convert a Post object back to JSON for database updates
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'profile_image': profileImage,
      'post_image': postImage,
      'caption': caption,
      'likes': likes,
      'comment_count': commentCount,
      'created_at': createdAt.toIso8601String(),
      'is_liked': isLiked,
      'is_bookmarked': isBookmarked,
      'hashtags': hashtags,
    };
  }

  // 3. Updated copyWith to include new fields
  Post copyWith({
    bool? isLiked,
    bool? isBookmarked,
    int? likes,
    int? commentCount,
  }) {
    return Post(
      id: id,
      username: username,
      profileImage: profileImage,
      postImage: postImage,
      caption: caption,
      likes: likes ?? this.likes,
      commentCount: commentCount ?? this.commentCount,
      createdAt: createdAt,
      isLiked: isLiked ?? this.isLiked,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      hashtags: hashtags,
    );
  }
}