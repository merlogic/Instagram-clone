import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController(text: 'zeke');
  final TextEditingController _usernameController = TextEditingController(text: 'zykdck');
  final TextEditingController _bioController = TextEditingController(text: 'carpe diem');
  final TextEditingController _linkController = TextEditingController(text: 'github.com/merlogic');

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Determine screen width to adjust layout
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktop = screenWidth > 600;

    return Scaffold(
      backgroundColor: isDesktop ? const Color(0xFFFAFAFA) : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Done',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          // On desktop, we wrap the form in a white card with a max width
          constraints: const BoxConstraints(maxWidth: 700),
          margin: isDesktop ? const EdgeInsets.symmetric(vertical: 30) : EdgeInsets.zero,
          padding: isDesktop ? const EdgeInsets.all(40) : EdgeInsets.zero,
          decoration: isDesktop
              ? BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(3),
                )
              : null,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                // 1. Profile Picture Section
                _buildProfilePictureSection(),
                
                const SizedBox(height: 30),

                // 2. Form Fields (Responsive Layout)
                _buildResponsiveField("Name", _nameController, isDesktop),
                _buildResponsiveField("Username", _usernameController, isDesktop),
                _buildResponsiveField("Bio", _bioController, isDesktop, maxLines: 3),
                _buildResponsiveField("Links", _linkController, isDesktop),
                
                const SizedBox(height: 40),
                
                // 3. Footer Links
                _buildFooterLink("Switch to professional account"),
                _buildFooterLink("Personal information settings"),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePictureSection() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 45,
          backgroundImage: AssetImage('assets/images/psyduck.jpg'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Change profile photo',
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildResponsiveField(String label, TextEditingController controller, bool isDesktop, {int maxLines = 1}) {
    if (isDesktop) {
      // Desktop Style: Label on the left, TextField on the right
      return Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 150,
              child: Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: TextField(
                controller: controller,
                maxLines: maxLines,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey.shade300)),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      // Mobile Style: Stacked label and field
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            TextField(
              controller: controller,
              maxLines: maxLines,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black12)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.black)),
              ),
            ),
          ],
        ),
      );
    }
  }

  Widget _buildFooterLink(String title) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.blue, fontSize: 15)),
      onTap: () {},
    );
  }
}