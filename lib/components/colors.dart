import 'package:flutter/material.dart';

abstract class CustomTheme {
   // Brend
   late Color primary;
   late Color secondary;
   late Color accent;
    
   // Semantic
   late Color negative;
   late Color warning;
   late Color positive;
   
   // Bacground
   late Color backgroundPrimary;
   late Color backgroundSecondary;
   
    // Text
    late Color textPrimary; // Heading, Display
    late Color textSecondary; // Label
    late Color textTertiary; // Heading, Label 
    late Color textBonus; // Placeholder, Headline
    late Color textLink; // Link
    
    // Icon
    late Color iconMedium;
    late Color iconSecondary;
    late Color iconTertiary;
}

class LightTheme implements CustomTheme {
    Color primary = Color(0xFFFFFFFF);
    Color secondary = Color(0xFF444444);
    Color accent = Color(0xFFFFC60B);
    
    Color negative = Color(0xFFFF370B);
    Color warning = Color(0xFFFF8B00);
    Color positive = Color(0xFF46A918);
    
    Color backgroundPrimary = Color(0xFFFFFFFF);
    Color backgroundSecondary = Color(0xFFEBF1F9);
    
    Color textPrimary = Color(0xFF000000);
    Color textSecondary = Color(0xFF383838);
    Color textTertiary = Color(0xFFFFFFFF);
    Color textBonus = Color(0xFF818C99);
    Color textLink = Color(0xFF0B7BFF);
    
    Color iconMedium = Color(0xFF818C99);
    Color iconSecondary = Color(0xFF99A2AD);
    Color iconTertiary = Color(0xFFB8C1CC);
    
}

// class DarkTheme {
 
//   Color icon_tertiary_alpha = Color.fromRGBO(255, 255, 255, 0.24);
  
// }
