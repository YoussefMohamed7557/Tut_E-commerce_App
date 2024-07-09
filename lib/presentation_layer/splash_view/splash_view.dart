
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tut_app/presentation_layer/resources/color_manager.dart';
import 'package:tut_app/presentation_layer/resources/image_assets.dart';
import 'package:tut_app/presentation_layer/resources/routes_manager.dart';
import 'package:tut_app/presentation_layer/resources/constants_manager.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
 _startDelay(){
   _timer = Timer(const Duration(seconds: ConstantsManager.splashDelay),_goNext);
 }
 _goNext(){
   Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorManager.PRIMARY,
      body: Center(child:Image.asset(ImageAssets.splashLogo),),
    );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _timer?.cancel();
    super.dispose();
  }
}
