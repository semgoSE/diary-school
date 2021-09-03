import 'package:flutter/material.dart';

abstract class CustomTheme {
    Color accent = Color(0xFF3f8ae0);
  Color background = Color(0xFFffffff);
 
  Color text_primary = Color(0xFF000000);
  Color text_placeholder = Color(0xFF818c99);
  Color text_secondary = Color(0xFF818c99);
  Color text_muted = Color(0xFF2c2d2e);
  Color text_name = Color(0xFF4986cc);
  Color text_subhead = Color(0xFF6d7885);
  Color text_tertiary = Color(0xFF99a2ad);

  Color header_background = Color(0xFFffffff);
  Color header_text = Color(0xFF000000);

  Color modal_card_background =  Colors.white;

  Color button_bot_shadow = Color(0xFFc4c8cc);
  Color button_commerce_background = Color(0xFF4bb34b);
  Color button_commerce_foreground = Color(0xFFffffff);
  Color button_muted_background = Color(0xFFf2f3f5);
  Color button_muted_foreground = Color(0xFF3f8ae0);
  Color button_outline_border = Color(0xFF3f8ae0);
  Color button_outline_foreground = Color(0xFF3f8ae0);
  Color button_primary_background = Color(0xFF4986cc);
  Color button_primary_foreground = Color(0xFFffffff);
  Color button_secondary_background = Color.fromRGBO(0, 28, 61, 0.05);
  Color button_secondary_background_highlighted = Color.fromRGBO(0, 28, 61, 0.03);
  Color button_secondary_destructive_background = Color.fromRGBO(0, 28, 61, 0.05);
  Color button_secondary_destructive_background_highlighted = Color.fromRGBO(0, 28, 61, 0.03);
  Color button_secondary_destructive_foreground = Color(0xFFe64646);
  Color button_secondary_destructive_foreground_highlighted = Color.fromRGBO(230, 70, 70, 0.60);
  Color button_secondary_foreground = Color(0xFF3f8ae0);
  Color button_secondary_foreground_highlighted = Color.fromRGBO(63, 138, 224, 0.60);
  Color button_tertiary_background = Color.fromRGBO(0, 0, 0, 0.00);
  Color button_tertiary_foreground = Color(0xFF4986cc);

  Color field_background = Color(0xFFf2f3f5);
  Color field_border = Color.fromRGBO(0, 0, 0, 0.12);
  Color field_error_background = Color(0xFFfaebeb);
  Color field_error_border = Color(0xFFe64646);
  Color field_text_placeholder = Color(0xFF818c99);
  Color field_valid_border = Color(0xFF4bb34b);

  Color icon_alpha_placeholder = Color(0xFFffffff);
  Color icon_medium = Color(0xFF818c99);
  Color icon_medium_alpha = Color.fromRGBO(0, 0, 0, 0.48);
  Color icon_name = Color(0xFF74a2d6);
  Color icon_outline_medium = Color(0xFF818c99);
  Color icon_outline_secondary = Color(0xFF99a2ad);
  Color icon_secondary = Color(0xFF99a2ad);
  Color icon_secondary_alpha = Color.fromRGBO(0, 0, 0, 0.36);
  Color icon_tertiary = Color(0xFFb8c1cc);
  Color icon_tertiary_alpha = Color.fromRGBO(0, 0, 0, 0.24);
}

class LightTheme extends CustomTheme {

  Color accent = Color(0xFF3f8ae0);
  Color background = Color(0xFFffffff);
 
  Color text_primary = Color(0xFF000000);
  Color text_placeholder = Color(0xFF818c99);
  Color text_secondary = Color(0xFF818c99);
  Color text_muted = Color(0xFF2c2d2e);
  Color text_name = Color(0xFF4986cc);
  Color text_subhead = Color(0xFF6d7885);
  Color text_tertiary = Color(0xFF99a2ad);

  Color header_background = Color(0xFFffffff);
  Color header_text = Color(0xFF000000);

  Color modal_card_background =  Colors.white;

  Color button_bot_shadow = Color(0xFFc4c8cc);
  Color button_commerce_background = Color(0xFF4bb34b);
  Color button_commerce_foreground = Color(0xFFffffff);
  Color button_muted_background = Color(0xFFf2f3f5);
  Color button_muted_foreground = Color(0xFF3f8ae0);
  Color button_outline_border = Color(0xFF3f8ae0);
  Color button_outline_foreground = Color(0xFF3f8ae0);
  Color button_primary_background = Color(0xFF4986cc);
  Color button_primary_foreground = Color(0xFFffffff);
  Color button_secondary_background = Color.fromRGBO(0, 28, 61, 0.05);
  Color button_secondary_background_highlighted = Color.fromRGBO(0, 28, 61, 0.03);
  Color button_secondary_destructive_background = Color.fromRGBO(0, 28, 61, 0.05);
  Color button_secondary_destructive_background_highlighted = Color.fromRGBO(0, 28, 61, 0.03);
  Color button_secondary_destructive_foreground = Color(0xFFe64646);
  Color button_secondary_destructive_foreground_highlighted = Color.fromRGBO(230, 70, 70, 0.60);
  Color button_secondary_foreground = Color(0xFF3f8ae0);
  Color button_secondary_foreground_highlighted = Color.fromRGBO(63, 138, 224, 0.60);
  Color button_tertiary_background = Color.fromRGBO(0, 0, 0, 0.00);
  Color button_tertiary_foreground = Color(0xFF4986cc);

  Color field_background = Color(0xFFf2f3f5);
  Color field_border = Color.fromRGBO(0, 0, 0, 0.12);
  Color field_error_background = Color(0xFFfaebeb);
  Color field_error_border = Color(0xFFe64646);
  Color field_text_placeholder = Color(0xFF818c99);
  Color field_valid_border = Color(0xFF4bb34b);

  Color icon_alpha_placeholder = Color(0xFFffffff);
  Color icon_medium = Color(0xFF818c99);
  Color icon_medium_alpha = Color.fromRGBO(0, 0, 0, 0.48);
  Color icon_name = Color(0xFF74a2d6);
  Color icon_outline_medium = Color(0xFF818c99);
  Color icon_outline_secondary = Color(0xFF99a2ad);
  Color icon_secondary = Color(0xFF99a2ad);
  Color icon_secondary_alpha = Color.fromRGBO(0, 0, 0, 0.36);
  Color icon_tertiary = Color(0xFFb8c1cc);
  Color icon_tertiary_alpha = Color.fromRGBO(0, 0, 0, 0.24);
}

class DarkTheme extends CustomTheme {
  //Accent Color
  Color accent = Color(0xFF71aaeb);
  Color background = Color(0xFF19191a);

  Color text_primary = Color(0xFFe1e3e6);
  Color text_placeholder = Color(0xFFaaaeb3);
  Color text_secondary = Color(0xFF76787a);
  Color text_muted = Color(0xFFc4c8cc);
  Color text_name = Color(0xFFe1e3e6);
  Color text_subhead = Color(0xff909499);
  Color text_tertiary = Color(0xFF5d5f61);

  //appBar
  Color header_background = Color(0xFF19191a);
  Color header_text = Color(0xFFe1e3e6);


  Color modal_card_background = Color(0xFF2c2d2e); 

  Color button_bot_shadow = Color(0xFF19191a);
  Color button_commerce_background = Color(0xFF4bb34b);
  Color button_commerce_foreground = Color(0xFFffffff);
  Color button_muted_background = Color(0xFF2c2d2e);
  Color button_muted_foreground = Color(0xFFe1e3e6);
  Color button_outline_border = Color(0xFFe1e3e6);
  Color button_outline_foreground = Color(0xFFe1e3e6);
  Color button_primary_background = Color(0xFFe1e3e6);
  Color button_primary_foreground = Color(0xFF19191a);
  Color button_secondary_background = Color(0xFF454647);
  Color button_secondary_background_highlighted = Color.fromRGBO(69, 70, 71, 0.60);
  Color button_secondary_destructive_background = Color(0xFF454647);
  Color button_secondary_destructive_background_highlighted = Color.fromRGBO(69, 70, 71, 0.60);
  Color button_secondary_destructive_foreground = Color(0xFFff5c5c);
  Color button_secondary_destructive_foreground_highlighted = Color.fromRGBO(255, 92, 92, 0.60);
  Color button_secondary_foreground = Color(0xFFe1e3e6);
  Color button_secondary_foreground_highlighted = Color.fromRGBO(225, 227, 230, 0.60);
  Color button_tertiary_background = Color.fromRGBO(0, 0, 0, 0.00);
  Color button_tertiary_foreground = Color(0xFFe1e3e6);

  //Field
  Color field_background = Color(0xFF232324);
  Color field_border = Color.fromRGBO(255, 255, 255, 0.12);
  Color field_error_background = Color(0xFF522e2e);
  Color field_error_border = Color(0xFFFF5c5c);
  Color field_text_placeholder = Color(0xFF76787a);
  Color field_valid_border = Color(0xFF4bb34b);

  //Icons
  Color icon_alpha_placeholder = Color(0xFFe1e3e6);
  Color icon_medium = Color(0xFF909499);
  Color icon_medium_alpha = Color.fromRGBO(255, 255, 255, 0.48);
  Color icon_name = Color(0xFFaaaeb3);
  Color icon_outline_medium = Color(0xFFaaaeb3);
  Color icon_outline_secondary = Color(0xFF909499);
  Color icon_secondary = Color(0xFF76787a);
  Color icon_secondary_alpha = Color.fromRGBO(255, 255, 255, 0.36);
  Color icon_tertiary = Color(0xFF5d5f61);
  Color icon_tertiary_alpha = Color.fromRGBO(255, 255, 255, 0.24);
  
}
