import 'dart:async';
import 'package:tut_app/domain_layer/data_classes/data_classes.dart';
import 'package:tut_app/presentation_layer/base/base_view_mode.dart';
import 'package:tut_app/presentation_layer/resources/image_assets.dart';
import 'package:tut_app/presentation_layer/resources/strings_manager.dart';

class OnboardingViewModel implements BaseViewModel,OnBoardingViewModelInputs,OnBoardingViewModelOutputs{
  final StreamController<SliderViewObject> _streamController = StreamController();
  late final List<SliderObject> _list;
  int _currentIndex = 0;
  @override
  void start() {
    _list = _getSliderData();
    _postDataToView();
  }
  @override
  void dispose() {
    _streamController.close();
  }
  @override
  int getNextSlideIndex() {
    int index = ++_currentIndex;
    if(index ==_list.length){
      index = 0;
    }
    return index;
  }
  @override
  int getPreviousIndex() {
    int index = --_currentIndex;
    if(index ==-1){
      index = _list.length-1;
    }
    return index;
  }
  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }
  @override
  Sink<SliderViewObject> get onboardingStreamInputs => _streamController.sink;

  @override
  Stream<SliderViewObject> get onboardingStreamOutputs => _streamController.stream.map((sliderViewObject)=>sliderViewObject);

  // private methods
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
  void _postDataToView(){
    onboardingStreamInputs.add(SliderViewObject(sliderObject: _list[_currentIndex], numberOfSlides: _list.length, currentIndex: _currentIndex));
  }
}
abstract class OnBoardingViewModelInputs{
  // the actions that will requested from view model
  int getNextSlideIndex();
  int getPreviousIndex();
  void onPageChanged(int index);
  Sink<SliderViewObject> get onboardingStreamInputs;
}
abstract class OnBoardingViewModelOutputs{
  Stream<SliderViewObject> get onboardingStreamOutputs;
}