import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  final List<Map<String, dynamic>> chats = const [
    {'name': 'zackie', 'message': 'Sent a reel by aespa_official', 'time': '2m', 'image': 'assets/images/mwykie.jpg', 'isUnread': true},
    {'name': 'ambr.g', 'message': 'Did you see my last message?', 'time': '1h', 'image': 'assets/images/amber.jpg', 'isUnread': false},
    {'name': 'bny.exe', 'message': 'New demo is ready.', 'time': '3h', 'image': 'assets/images/chapel.jpg', 'isUnread': true},
    {'name': 'haikyu', 'message': 'SENT.', 'time': '5h', 'image': 'assets/images/haik.jpg', 'isUnread': false},
    {'name': 'rubyjane', 'message': 'Are you free?', 'time': '10m', 'image': 'assets/images/jen(1).jpg', 'isUnread': true},
  ];

  @override
  Widget build(BuildContext context) {
    // Determine screen size
    final bool isWideScreen = MediaQuery.of(context).size.width > 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: isWideScreen, // Center title on desktop
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: const Text(
          'Messages',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.video_call_outlined, color: Colors.black), onPressed: () {}),
          IconButton(icon: const Icon(Icons.add, color: Colors.black), onPressed: () {}),
        ],
      ),
      // Center the content and constrain width for Web/Desktop
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700), // Max width for readability
          child: Column(
            children: [
              // 1. Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, size: 20, color: Colors.grey),
                      hintText: 'Search',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              // 2. Chat List
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(top: 8),
                  itemCount: chats.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 4),
                  itemBuilder: (context, index) {
                    final chat = chats[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(chat['image']),
                      ),
                      title: Text(
                        chat['name'],
                        style: TextStyle(
                          fontWeight: chat['isUnread'] ? FontWeight.bold : FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Text(
                        chat['message'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: chat['isUnread'] ? Colors.black : Colors.grey[600],
                          fontWeight: chat['isUnread'] ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            chat['time'],
                            style: const TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          if (chat['isUnread']) ...[
                            const SizedBox(height: 6),
                            Container(
                              width: 8,
                              height: 8,
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ]
                        ],
                      ),
                      onTap: () {},
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}