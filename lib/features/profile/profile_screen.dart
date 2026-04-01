import 'package:flutter/material.dart';
import '../../shared/constants/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> profilePosts = [
      'assets/images/wave.jpg',
      'assets/images/cat.jpg',   
      'assets/images/nature.jpg',
      'assets/images/daisy.jpg', 
      'assets/images/coffee.jpg',
      'assets/images/veg.jpg',   
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text('zykdck', 
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        actions: [
          IconButton(
            icon: const Icon(Icons.add_box_outlined, color: Colors.black), 
            onPressed: () {}
          ),
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black), 
            onPressed: () {}
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // using psyduck for profile icon
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade200, width: 1),
                  ),
                  child: const CircleAvatar(
                    radius: 42,
                    backgroundColor: Colors.amberAccent,
                    backgroundImage: AssetImage('assets/images/psyduck.jpg'), 
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn("5", "Posts"), // Updated count
                      _buildStatColumn("2.0k", "Followers"),
                      _buildStatColumn("2002", "Following"),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
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
                Expanded(child: _buildButton("Edit Profile")),
                const SizedBox(width: 8),
                Expanded(child: _buildButton("Share Profile")),
                const SizedBox(width: 8),
                _buildSquareButton(Icons.person_add_outlined),
              ],
            ),
          ),
          
          const SizedBox(height: 20),
          
          // 4. Tab Bar (Grid View Icon)
          const Divider(height: 1),
          const SizedBox(
            height: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.grid_on_sharp, size: 24),
                Icon(Icons.assignment_ind_outlined, size: 24, color: Colors.grey),
              ],
            ),
          ),

          // 5. Post Grid
          Expanded(
            child: GridView.builder(
              itemCount: profilePosts.length,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, 
                crossAxisSpacing: 1.5, 
                mainAxisSpacing: 1.5,
              ),
              itemBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(profilePosts[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Column _buildStatColumn(String number, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(number, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget _buildButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(text, 
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13))
      ),
    );
  }

  Widget _buildSquareButton(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icon, size: 20),
    );
  }
}