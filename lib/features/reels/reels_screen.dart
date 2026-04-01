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
            fontSize: 20, // Slightly smaller title
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
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Keep 3 or change to 4 for even smaller boxes
          crossAxisSpacing: 2, 
          mainAxisSpacing: 2,  
          childAspectRatio: 0.8, // Changed from 0.62 to 0.8 (Less "tall", more natural)
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            // Optional: adds a tiny rounded corner like modern UI
            borderRadius: BorderRadius.circular(2),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  reelAssets[index],
                  fit: BoxFit.cover, 
                ),
                
                Positioned(
                  bottom: 5,
                  left: 5,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.play_arrow_outlined, color: Colors.white, size: 14),
                        SizedBox(width: 2),
                        Text(
                          '125K',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
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