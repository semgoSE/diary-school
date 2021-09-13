import 'package:flutter/material.dart';

abstract class CustomTheme {
   // Brend
   Color primary;
   Color secondary;
   Color accent;
    
   // Semantic
   Color negative;
   Color warning;
   Color positive;
   
   // Bacground
   Color backgroundPrimary;
   Color backgroundSecondary;
   
    // Text
    Color textPrimary; // Heading, Display
    Color textSecondary; // Label
    Color textTertiary; // Heading, Label 
    Color textBonus; // Placeholder, Headline
    Color textLink; // Link
    
    // Icon
    Color iconMedium;
    Color iconSecondary;
    Color iconTertiary;
}

class LightTheme extends CustomTheme {
    primary = Color(0xFFFFFFFF);
    secondary = Color(0xFF444444);
    accent = Color(0xFFFFC60B);
    
    negative = Color(0xFFFF370B);
    warning = Color(0xFFFF8B00);
    positive = Color(0xFF46A918);
    
    backgroundPrimary = Color(0xFFFFFFFF);
    backgroundSecondary = Color(0xFFEBF1F9);
    
    textPrimary = Color(0xFF000000);
    textSecondary = Color(0xFF383838);
    textTertiary = Color(0xFFFFFFFF);
    textBonus = Color(0xFF818C99);
    textLink = Color(0xFF0B7BFF);
    
    iconMedium = Color(0xFF818C99);
    iconSecondary = Color(0xFF99A2AD);
    iconTertiary = Color(0xFFB8C1CC);
    
}

class DarkTheme extends CustomTheme {
 
  Color icon_tertiary_alpha = Color.fromRGBO(255, 255, 255, 0.24);
  
}
