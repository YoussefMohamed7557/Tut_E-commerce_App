import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tut_app/presentation_layer/fonts_manager.dart';

TextStyle _getTextStyle(double fontSize, FontWeight fontWight, Color color){
  return TextStyle(color: color, fontWeight: fontWight,fontSize: fontSize,fontFamily: FontConstants.fontFamily);
}

//regular style
TextStyle getRegularFont({double fontSize = FontSizeManager.s12,required Color color}){
  return _getTextStyle(fontSize, FontWightManager.regular, color);
}

//light style
TextStyle getLightFont({double fontSize = FontSizeManager.s12,required Color color}){
  return _getTextStyle(fontSize, FontWightManager.light, color);
}
//medium style
TextStyle getMediumFont({double fontSize = FontSizeManager.s12,required Color color}){
  return _getTextStyle(fontSize, FontWightManager.medium, color);
}

//semi bold style
TextStyle getSemiBoldFont({double fontSize = FontSizeManager.s12,required Color color}){
  return _getTextStyle(fontSize, FontWightManager.semiBold, color);
}

//bold style
TextStyle getBoldFont({double fontSize = FontSizeManager.s12,required Color color}){
  return _getTextStyle(fontSize, FontWightManager.bold, color);
}