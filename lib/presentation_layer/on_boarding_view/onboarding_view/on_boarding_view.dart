import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tut_app/domain_layer/data_classes/data_classes.dart';
import 'package:tut_app/presentation_layer/on_boarding_view/onboarding_view_model/onboarding_view_model.dart';
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
  final PageController _pageController = PageController();
  final OnboardingViewModel _viewModel = OnboardingViewModel();
  void bindViewModel(){
    _viewModel.start();
  }
  @override
  void initState() {
    bindViewModel();
    super.initState();
  }
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: _viewModel.onboardingStreamOutputs, builder: (context, snapshot) {
      return getContentWidget(snapshot.data);
    },);
  }
  Widget getContentWidget(SliderViewObject? sliderViewObject){
    if (sliderViewObject == null){
      return Container(child: Center(child: Text("null object"),),color: Colors.white,);
    }
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
          return OnBoardingPage(sliderViewObject.sliderObject);
        },
        controller: _pageController,
        itemCount: sliderViewObject.numberOfSlides,
        onPageChanged: (index) {
          _viewModel.onPageChanged(index);
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
            _getBottomSheetIcons(sliderViewObject)
          ],
        ),
      ),
    );
  }
  Widget _getBottomSheetIcons(SliderViewObject sliderViewObject) {
    return Container(
      color: ColorManager.PRIMARY,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSizes.s14),
            child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(_viewModel.getPreviousIndex(), duration: Duration(microseconds: ConstantsManager.sligerAnimatonTime), curve: Curves.bounceInOut);
                },
                child: SvgPicture.asset(ImageAssets.leftArrowIc,
                    width: AppSizes.s20, height: AppSizes.s20)),
          ),
          Row(
            children: [
              for (int i = 0; i < sliderViewObject.numberOfSlides; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p8),
                  child: _getProperCircle(i,sliderViewObject.currentIndex),
                )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppSizes.s14),
            child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(_viewModel.getNextSlideIndex(), duration: Duration(microseconds: ConstantsManager.sligerAnimatonTime), curve: Curves.bounceInOut);
                },
                child: SvgPicture.asset(ImageAssets.rightArrowIc,
                    width: AppSizes.s20, height: AppSizes.s20)),
          ),
        ],
      ),
    );
  }
  Widget _getProperCircle(int index,int _currentIndex) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCirlceIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }
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
