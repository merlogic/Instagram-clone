import 'package:flutter/material.dart';
import '../../models/post.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> with SingleTickerProviderStateMixin {
  bool isLikeAnimating = false;
  late bool isLiked;
  late bool isBookmarked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.post.isLiked;
    isBookmarked = widget.post.isBookmarked;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Header
        ListTile(
          dense: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          leading: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300, width: 0.5),
            ),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: Colors.grey[200],
              // ASSET CHECK: Ensure path matches dummy_data (e.g., assets/images/karina.jpg)
              backgroundImage: AssetImage(widget.post.profileImage),
            ),
          ),
          title: Text(
            widget.post.username,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
          trailing: IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black87),
            onPressed: () {}, // Add menu options later
          ),
        ),

        // 2. Image with Double-Tap Animation
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              isLikeAnimating = true;
              isLiked = true;
            });
            // Heart animation duration
            Future.delayed(const Duration(milliseconds: 800), () {
              if (mounted) setState(() => isLikeAnimating = false);
            });
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              AspectRatio(
                aspectRatio: 1, // Keeps the post perfectly square like IG
                child: Image.asset(
                  widget.post.postImage,
                  fit: BoxFit.cover,
                  // The errorBuilder is your "safety net" if a filename is misspelled
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.broken_image, size: 40, color: Colors.grey),
                          SizedBox(height: 8),
                          Text('Image not found', style: TextStyle(color: Colors.grey, fontSize: 12)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              
              // Animated Heart Overlay
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: isLikeAnimating ? 1 : 0,
                child: AnimatedScale(
                  duration: const Duration(milliseconds: 300),
                  scale: isLikeAnimating ? 1.0 : 0.0,
                  curve: Curves.elasticOut,
                  child: const Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: 100,
                    shadows: [Shadow(blurRadius: 20, color: Colors.black26)],
                  ),
                ),
              ),
            ],
          ),
        ),

        // 3. Action Row
        Row(
          children: [
            IconButton(
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: isLiked ? Colors.red : Colors.black,
                size: 28,
              ),
              onPressed: () => setState(() => isLiked = !isLiked),
            ),
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline, size: 24),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send_outlined, size: 24),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                color: Colors.black,
                size: 26,
              ),
              onPressed: () => setState(() => isBookmarked = !isBookmarked),
            ),
          ],
        ),

        // 4. Content Section
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${widget.post.likes + (isLiked && !widget.post.isLiked ? 1 : 0)} likes',
                style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14),
              ),
              const SizedBox(height: 6),
              RichText(
                text: TextSpan(
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  children: [
                    TextSpan(
                      text: '${widget.post.username} ',
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    TextSpan(text: widget.post.caption),
                  ],
                ),
              ),
              if (widget.post.commentCount > 0) ...[
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    'View all ${widget.post.commentCount} comments',
                    style: const TextStyle(color: Colors.grey, fontSize: 13),
                  ),
                ),
              ],
              const SizedBox(height: 4),
              Text(
                _getTimestamp(widget.post.createdAt),
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ],
    );
  }

  String _getTimestamp(DateTime date) {
    final duration = DateTime.now().difference(date);
    if (duration.inDays > 0) return '${duration.inDays} DAYS AGO';
    if (duration.inHours > 0) return '${duration.inHours} HOURS AGO';
    if (duration.inMinutes > 0) return '${duration.inMinutes} MINUTES AGO';
    return 'JUST NOW';
  }

}