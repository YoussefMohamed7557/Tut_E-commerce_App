import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tut_app/presentation_layer/resources/constants_manager.dart';
import 'package:tut_app/presentation_layer/resources/image_assets.dart';
import 'package:tut_app/presentation_layer/resources/routes_manager.dart';
import 'package:tut_app/presentation_layer/resources/strings_manager.dart';
import 'package:tut_app/presentation_layer/resources/color_manager.dart';
import 'package:tut_app/presentation_layer/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late final List<SliderObject> _list = _getSliderData();
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  List<SliderObject> _getSliderData() => [
        SliderObject(StringsManager.onBoardingTitle1,
            StringsManager.onBoardingSubTitle1, ImageAssets.onBoardingLogo1),
        SliderObject(StringsManager.onBoardingTitle2,
            StringsManager.onBoardingSubTitle2, ImageAssets.onBoardingLogo2),
        SliderObject(StringsManager.onBoardingTitle3,
            StringsManager.onBoardingSubTitle3, ImageAssets.onBoardingLogo3),
        SliderObject(StringsManager.onBoardingTitle4,
            StringsManager.onBoardingSubTitle4, ImageAssets.onBoardingLogo4),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.White,
      appBar: AppBar(
        backgroundColor: ColorManager.White,
        elevation: AppSizes.s0,
        systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarIconBrightness: Brightness.dark,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.dark,
            statusBarColor: ColorManager.White),
      ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return OnBoardingPage(_list[_currentIndex]);
        },
        controller: _pageController,
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      bottomSheet: Container(
        color: ColorManager.White,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p4),
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(
                  StringsManager.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _getBottomSheetIcons()
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetIcons() {
    return Container(
      color: ColorManager.PRIMARY,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.s14),
            child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(_getPreviousIndex(), duration: Duration(microseconds: ConstantsManager.sligerAnimatonTime), curve: Curves.bounceInOut);
                },
                child: SvgPicture.asset(ImageAssets.leftArrowIc,
                    width: AppSizes.s20, height: AppSizes.s20)),
          ),
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSizes.s14),
            child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(_getNextIndex(), duration: Duration(microseconds: ConstantsManager.sligerAnimatonTime), curve: Curves.bounceInOut);
                },
                child: SvgPicture.asset(ImageAssets.rightArrowIc,
                    width: AppSizes.s20, height: AppSizes.s20)),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCirlceIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }

  int _getPreviousIndex() {
    int index = --_currentIndex;
    if(index ==-1){
      index = _list.length-1;
    }
    return index;
  }

  int _getNextIndex() {
    int index = ++_currentIndex;
    if(index ==_list.length){
      index = 0;
    }
    return index;
  }
}

class SliderObject {
  String title;
  String subTitle;
  String imagePath;
  SliderObject(this.title, this.subTitle, this.imagePath);
}

class OnBoardingPage extends StatelessWidget {
  SliderObject _sliderObject;
  OnBoardingPage(this._sliderObject, {super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSizes.s40),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelMedium,
          ),
        ),
        SizedBox(
          height: AppSizes.s60,
        ),
        SvgPicture.asset(_sliderObject.imagePath)
      ],
    );
  }
}
