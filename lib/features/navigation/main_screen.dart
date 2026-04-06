import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:igclone/features/message/message_screen.dart';
import 'package:igclone/features/reels/reels_screen.dart';
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
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Threshold for desktop/tablet view
        bool isDesktop = constraints.maxWidth > 800;

        return Scaffold(
          extendBody: true,
          body: Row(
            children: [
              // 1. Sidebar for Desktop
              if (isDesktop)
                _buildDesktopSidebar(),
              
              // 2. Main Content Area
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) => setState(() => _page = index),
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    FeedScreen(),
                    const ReelsScreen(),
                    const MessageScreen(),
                    const SearchScreen(),
                    const ProfileScreen(),
                  ],
                ),
              ),
            ],
          ),
          // 3. Bottom Bar for Mobile only
          bottomNavigationBar: isDesktop ? null : _buildMobileBottomBar(),
        );
      },
    );
  }

  // Desktop Sidebar implementation
  Widget _buildDesktopSidebar() {
    return Container(
      width: 240, // Standard IG Web sidebar width
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(right: BorderSide(color: Colors.grey.shade300, width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Text(
              'Instagram',
              style: TextStyle(fontFamily: 'Billabong', fontSize: 28), // Ensure font is in pubspec
            ),
          ),
          _buildSidebarItem(0, Icons.home_filled, Icons.home_outlined, 'Home'),
          _buildSidebarItem(3, Icons.search, Icons.search_outlined, 'Search'),
          _buildSidebarItem(1, Icons.video_library, Icons.video_library_outlined, 'Reels'),
          _buildSidebarItem(2, Icons.chat_bubble, Icons.chat_bubble_outline, 'Messages'),
          _buildSidebarItem(4, Icons.person, Icons.person_outline, 'Profile'),
          const Spacer(),
          _buildSidebarItem(99, Icons.menu, Icons.menu, 'More'),
        ],
      ),
    );
  }

  Widget _buildSidebarItem(int index, IconData activeIcon, IconData icon, String label) {
    bool isSelected = _page == index;
    return InkWell(
      onTap: () => index == 99 ? null : navigationTapped(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isSelected ? Colors.grey[100] : Colors.transparent,
          ),
          child: Row(
            children: [
              Icon(isSelected ? activeIcon : icon, color: Colors.black, size: 28),
              const SizedBox(width: 16),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Mobile Bottom Bar implementation (Your original glassmorphism code)
  Widget _buildMobileBottomBar() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2), width: 0.5)),
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
              BottomNavigationBarItem(icon: Icon(Icons.home_outlined), activeIcon: Icon(Icons.home_filled), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.video_library_outlined), activeIcon: Icon(Icons.video_library), label: 'Reels'),
              BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), activeIcon: Icon(Icons.chat_bubble), label: 'Messages'),
              BottomNavigationBarItem(icon: Icon(Icons.search), activeIcon: Icon(Icons.search_rounded), label: 'Search'),
              BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        ),
      ),
    );
  }
}