
import 'package:flutter/material.dart';
import 'package:tut_app/presentation_layer/resources/color_manager.dart';
import 'package:tut_app/presentation_layer/resources/image_assets.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.PRIMARY,
      body: Center(child:Image.asset(ImageAssets.splashLogo),),
    );
  }
}
