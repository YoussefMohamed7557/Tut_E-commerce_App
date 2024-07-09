import 'package:flutter/material.dart';
import 'package:tut_app/presentation_layer/resources/color_manager.dart';
import 'package:tut_app/presentation_layer/resources/fonts_manager.dart';
import 'package:tut_app/presentation_layer/resources/styles_manager.dart';
import 'package:tut_app/presentation_layer/resources/values_manager.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    // main colors
        primaryColor: ColorManager.PRIMARY,
        primaryColorLight: ColorManager.LIGHT_PRIMARY,
        primaryColorDark: ColorManager.DARK_PRIMARY,
        disabledColor: ColorManager.GRAY1,
        splashColor: ColorManager.LIGHT_PRIMARY, //ripple effect color
    //card view theme
        cardTheme: CardTheme(
          color: ColorManager.White,
          shadowColor: ColorManager.GRAY,
          elevation: AppSizes.s4
        ),
    //app bar theme
        appBarTheme: AppBarTheme(
          centerTitle: true,
          color: ColorManager.PRIMARY,
          elevation: AppSizes.s4,
          shadowColor: ColorManager.LIGHT_PRIMARY,
          titleTextStyle: getRegularFont(color: ColorManager.White,fontSize: FontSizeManager.s16)
        ),
    //bottom theme
        buttonTheme: ButtonThemeData(
          disabledColor: ColorManager.GRAY1,
          buttonColor: ColorManager.PRIMARY,
          splashColor: ColorManager.LIGHT_PRIMARY,
          shape: StadiumBorder()
        ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          textStyle: getRegularFont(color: ColorManager.White,fontSize: FontSizeManager.s17),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppSizes.s12)
        ),
          backgroundColor: ColorManager.PRIMARY,
      ),
    ),
    // text theme
    textTheme: TextTheme(
      displayLarge: getLightFont(color: ColorManager.White,fontSize: FontSizeManager.s22),
      displayMedium: getSemiBoldFont(color: ColorManager.DARK_GRAY,fontSize: FontSizeManager.s16),
      titleMedium: getSemiBoldFont(color: ColorManager.PRIMARY,fontSize: FontSizeManager.s20),
      labelMedium: getRegularFont(color: ColorManager.GRAY,fontSize: FontSizeManager.s14),
    ),
    //input decoration theme
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(AppPadding.p8),
      hintStyle: getRegularFont(color: ColorManager.GRAY,fontSize: FontSizeManager.s14),
      labelStyle: getMediumFont(color: ColorManager.GRAY,fontSize: FontSizeManager.s14),
      errorStyle: getRegularFont(color: ColorManager.ErrorColor),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.PRIMARY,width: AppSizes.s1_5),borderRadius: BorderRadius.circular(AppSizes.s8)),
      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.GRAY,width: AppSizes.s1_5),borderRadius: BorderRadius.circular(AppSizes.s8)),
      errorBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.ErrorColor,width: AppSizes.s1_5),borderRadius: BorderRadius.circular(AppSizes.s8)),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.PRIMARY,width: AppSizes.s1_5),borderRadius: BorderRadius.circular(AppSizes.s8)),
    )
  );
}