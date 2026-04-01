import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Data list based on your request
  final List<Map<String, String>> searchUsers = [
    {
      'username': 'loverruk',
      'name': 'Love Pattranite',
      'image': 'assets/images/love.jpg', 
    },
    {
      'username': 'F1',
      'name': 'formula 1',
      'image': 'assets/images/f1.jpg',
    },
    {
      'username': 'for_everyoung10',
      'name': 'WONYOUNG',
      'image': 'assets/images/wonyoung.jpg',
    },
    {
      'username': 'twicetagram',
      'name' : 'TWICE',
      'image': 'assets/images/twice.jpg',
    }
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: SizedBox(
          height: 40,
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: const TextStyle(color: Colors.grey),
              prefixIcon: const Icon(Icons.search, color: Colors.black54, size: 20),
              fillColor: Colors.grey[200],
              filled: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: searchUsers.length,
        itemBuilder: (context, index) {
          final user = searchUsers[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.grey[300],
              backgroundImage: AssetImage(user['image']!),
              onBackgroundImageError: (_, __) => const Icon(Icons.person),
            ),
            title: Text(
              user['username']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              user['name']!,
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: const Icon(Icons.close, size: 18, color: Colors.grey),
            onTap: () {
              // Handle navigation to user profile here
              print("Tapped on ${user['username']}");
            },
          );
        },
      ),
    );
  }
}