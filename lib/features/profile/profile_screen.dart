import 'package:flutter/material.dart';
import 'package:igclone/features/profile/editprofile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<String> profilePosts = [
    'assets/images/wave.jpg',
    'assets/images/cat.jpg',
    'assets/images/nature.jpg',
    'assets/images/daisy.jpg',
    'assets/images/coffee.jpg',
    'assets/images/veg.jpg',
  ];

  final List<Map<String, String>> highlights = [
    {'name': 'New', 'image': ''}, 
    {'name': 'my pov', 'image': 'assets/images/pov.jpg'},
    {'name': 'eats', 'image': 'assets/images/food.jpg'},
    {'name': 'playlist', 'image': 'assets/images/songs.jpg'},
    {'name': 'trips', 'image': 'assets/images/trips.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text('zykdck', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        actions: [
          IconButton(icon: const Icon(Icons.add_box_outlined, color: Colors.black), onPressed: () {}),
          IconButton(icon: const Icon(Icons.menu, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 935),
          child: Column(
            children: [
              // 1. Header Section
              _buildHeader(isWideScreen),

              // 2. Bio Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('zeke', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('carpe diem'),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 3. Action Buttons 
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildButton("Edit Profile", () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => const EditProfileScreen(),
                          ),
                        );
                      }),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _buildButton("Share Profile", () {
                        // Action for Share
                      }),
                    ),
                    const SizedBox(width: 8),
                    _buildSquareButton(Icons.person_add_outlined),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // 4. Highlights Section
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: highlights.length,
                  itemBuilder: (context, index) {
                    final highlight = highlights[index];
                    return _buildHighlightItem(highlight['name']!, highlight['image']!);
                  },
                ),
              ),

              const SizedBox(height: 10),

              // 5. Tab Bar
              const Divider(height: 1),
              _buildTabBar(),

              // 6. Post Grid
              Expanded(
                child: GridView.builder(
                  itemCount: profilePosts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screenWidth < 600 ? 3 : 6,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  itemBuilder: (context, index) => Image.asset(profilePosts[index], fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Helper Widgets ---

  Widget _buildHighlightItem(String title, String imagePath) {
    bool isAddButton = imagePath.isEmpty;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: CircleAvatar(
              radius: 28,
              backgroundColor: isAddButton ? Colors.white : Colors.grey[200],
              backgroundImage: isAddButton ? null : AssetImage(imagePath),
              child: isAddButton ? const Icon(Icons.add, color: Colors.black, size: 30) : null,
            ),
          ),
          const SizedBox(height: 4),
          Text(title, style: const TextStyle(fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isWide) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 42,
            backgroundImage: AssetImage('assets/images/psyduck.jpg'),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatColumn("6", "Posts"),
                _buildStatColumn("2.0k", "Followers"),
                _buildStatColumn("2002", "Following"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column _buildStatColumn(String number, String label) {
    return Column(
      children: [
        Text(number, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget _buildButton(String text, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
        ),
      ),
    );
  }

  Widget _buildSquareButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
      child: Icon(icon, size: 20),
    );
  }

  Widget _buildTabBar() {
    return const SizedBox(
      height: 48,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.grid_on_sharp, size: 20),
          SizedBox(width: 8),
          Text("POSTS", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}