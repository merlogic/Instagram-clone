import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  final List<String> reelAssets = const [
    'assets/images/dps.jpg',
    'assets/images/cig.jpg',
    'assets/images/rid.jpg',
    'assets/images/salt.jpg',
    'assets/images/tur.jpg',
    'assets/images/catts.jpg',
    'assets/images/call.jpg',
    'assets/images/butterfly.jpg', 
    'assets/images/fire.jpg',
    'assets/images/daiss.jpg',
    'assets/images/tokyo.jpg',
    'assets/images/taurus.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    // Determine screen width
    double width = MediaQuery.of(context).size.width;
    
    // Dynamic column count: 3 for mobile, 5 for tablet, 7 for web/desktop
    int crossAxisCount = width < 600 ? 3 : (width < 1000 ? 5 : 7);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          'Reels',
          style: TextStyle(
            color: Colors.black, 
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(1), 
        itemCount: reelAssets.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount, 
          crossAxisSpacing: 2, 
          mainAxisSpacing: 2,  
          childAspectRatio: 0.8, 
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  reelAssets[index],
                  fit: BoxFit.cover, 
                  // Fallback for missing images to prevent red screen
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey[200],
                    child: const Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                ),
                
                // Overlay View Count
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.play_arrow_outlined, color: Colors.white, size: 14),
                        SizedBox(width: 2),
                        Text(
                          '125K',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}