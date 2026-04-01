import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:igclone/features/search/search_screen.dart'; 
import '../feed/feed_screen.dart';
import '../profile/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _page = 0;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, 
      body: PageView(
        controller: pageController,
        onPageChanged: (index) => setState(() => _page = index),
        physics: const NeverScrollableScrollPhysics(), 
        children: [
          FeedScreen(),
          const Center(child: Text('Reels Content')), // Updated placeholder
          const Center(child: Text('Messages/Inbox')), 
          const SearchScreen(),
          const ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.2), width: 0.5),
          ),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: BottomNavigationBar(
              backgroundColor: Colors.white.withOpacity(0.7),
              type: BottomNavigationBarType.fixed,
              currentIndex: _page,
              onTap: navigationTapped,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.black38,
              elevation: 0, 
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                // HOME
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), 
                  activeIcon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
            
                // REELS
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_library_outlined), 
                  activeIcon: Icon(Icons.video_library),
                  label: 'Reels',
                ),
                
                // MESSAGES / INBOX
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat_bubble_outline), 
                  activeIcon: Icon(Icons.chat_bubble),
                  label: 'Messages',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search), 
                  activeIcon: Icon(Icons.search_rounded),
                  label: 'Search',
                ),
                // PROFILE
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline), 
                  activeIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}