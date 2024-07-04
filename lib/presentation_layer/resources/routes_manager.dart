import 'package:flutter/material.dart';
import 'package:tut_app/presentation_layer/details_store_view/details_store_view.dart';
import 'package:tut_app/presentation_layer/forgot_password_view/forgot_password_view.dart';
import 'package:tut_app/presentation_layer/login_view/login_view.dart';
import 'package:tut_app/presentation_layer/main_view/main_view.dart';
import 'package:tut_app/presentation_layer/on_boarding_view/on_boarding_view.dart';
import 'package:tut_app/presentation_layer/register_view/register_view.dart';
import 'package:tut_app/presentation_layer/settings_view/settings_view.dart';
import 'package:tut_app/presentation_layer/splash_view/splash_view.dart';
import 'package:tut_app/presentation_layer/resources/strings_manager.dart';
class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onBoarding";
  static const String loginRoute = "/loginRoute";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotPassword";
  static const String mainRoute = "/main";
  static const String detailsStoreRoute = "/detailsStore";
  static const String settingsRoute = "/settings";
}
class RoutesGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch (settings.name){
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_)=>SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_)=>OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_)=>LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_)=>RegisterView());
      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_)=>ForgotPasswordView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_)=>MainView());
      case Routes.detailsStoreRoute:
        return MaterialPageRoute(builder: (_)=>DetailsStoreView());
      case Routes.settingsRoute:
        return MaterialPageRoute(builder: (_)=>SettingsView());
      default:
        return unDefinedPageRoute();
    }
  }

  static Route<dynamic> unDefinedPageRoute() {
    return MaterialPageRoute(builder: (_)=>Scaffold(
      appBar: AppBar(title: Text(StringsManager.noRouteFound),),
      body: Center(child: Text(StringsManager.noRouteFound),),
    ));
  }
}