import 'package:flutter/material.dart';

class AppColors {
  static const Color instaBlue = Color(0xFF0095F6);
  static const Color glassWhite = Color.fromRGBO(255, 255, 255, 0.7);
  static const Color lightGrey = Color(0xFFFAFAFA);
  static const Color borderGrey = Color(0xFFDBDBDB);
  
  // Gradient for stories
  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [Color(0xFFFCAF45), Color(0xFFF56040), Color(0xFFC13584)],
  );
}