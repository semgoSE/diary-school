import 'package:flutter/material.dart';

class LightTheme {

  //Accent Color
  Color accent = Color(0xFF3f8ae0);

  //Button
  Map<String, Color> button = {
    "button_bot_shadow": Color(0xFFc4c8cc),
    "button_commerce_background": Color(0xFF4bb34b),
    "button_commerce_foreground": Color(0xFFffffff),
    "button_muted_background": Color(0xFFf2f3f5),
    "button_muted_foreground": Color(0xFF3f8ae0),
    "button_outline_border": Color(0xFF3f8ae0),
    "button_outline_foreground": Color(0xFF3f8ae0),
    "button_primary_background": Color(0xFF4986cc),
    "button_primary_foreground": Color(0xFFffffff),
    "button_secondary_background": Color.fromRGBO(0, 28, 61, 0.05),
    "button_secondary_background_highlighted": Color.fromRGBO(0, 28, 61, 0.03),
    "button_secondary_destructive_background": Color.fromRGBO(0, 28, 61, 0.05),
    "button_secondary_destructive_background_highlighted": Color.fromRGBO(0, 28, 61, 0.03),
    "button_secondary_destructive_foreground": Color(0xFFe64646),
    "button_secondary_destructive_foreground_highlighted": Color.fromRGBO(230, 70, 70, 0.60),
    "button_secondary_foreground": Color(0xFF3f8ae0),
    "button_secondary_foreground_highlighted": Color.fromRGBO(63, 138, 224, 0.60),
    "button_tertiary_background": Color.fromRGBO(0, 0, 0, 0.00),
    "button_tertiary_foreground": Color(0xFF4986cc),
  };

  //Field
  Map<String, Color> field = {
    "field_background": Color(0xFFf2f3f5),
    "field_border": Color.fromRGBO(0, 0, 0, 0.12),
    "field_error_background": Color(0xFFfaebeb),
    "field_error_border": Color(0xFFe64646),
    "field_text_placeholder": Color(0xFF818c99),
    "field_valid_border": Color(0xFF4bb34b),
  };
  
} 

class DarkTheme {

  //Accent Color
  Color accent = Color(0xFF71aaeb);

  //Button
  Map<String, Color> button = {
    "button_bot_shadow": Color(0xFF19191a),
    "button_commerce_background": Color(0xFF4bb34b),
    "button_commerce_foreground": Color(0xFFffffff),
    "button_muted_background": Color(0xFF2c2d2e),
    "button_muted_foreground": Color(0xFFe1e3e6),
    "button_outline_border": Color(0xFFe1e3e6),
    "button_outline_foreground": Color(0xFFe1e3e6),
    "button_primary_background": Color(0xFFe1e3e6),
    "button_primary_foreground": Color(0xFF19191a),
    "button_secondary_background": Color(0xFF454647),
    "button_secondary_background_highlighted": Color.fromRGBO(69, 70, 71, 0.60),
    "button_secondary_destructive_background": Color(0xFF454647),
    "button_secondary_destructive_background_highlighted": Color.fromRGBO(69, 70, 71, 0.60),
    "button_secondary_destructive_foreground": Color(0xFFff5c5c),
    "button_secondary_destructive_foreground_highlighted": Color.fromRGBO(255, 92, 92, 0.60),
    "button_secondary_foreground": Color(0xFFe1e3e6),
    "button_secondary_foreground_highlighted": Color.fromRGBO(225, 227, 230, 0.60),
    "button_tertiary_background": Color.fromRGBO(0, 0, 0, 0.00),
    "button_tertiary_foreground": Color(0xFFe1e3e6),
  };

  //Field
  Map<String, Color> field = {
    "field_background": Color(0xFF232324),
    "field_border": Color.fromRGBO(255, 255, 255, 0.12),
    "field_error_background": Color(0xFF522e2e),
    "field_error_border": Color(0xFFFF5c5c),
    "field_text_placeholder": Color(0xFF76787a),
    "field_valid_border": Color(0xFF4bb34b),
  };

}