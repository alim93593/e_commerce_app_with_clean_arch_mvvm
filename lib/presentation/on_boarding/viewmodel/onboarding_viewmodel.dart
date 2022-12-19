// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter_clean_arch_mvvm/domain/models.dart';
import 'package:flutter_clean_arch_mvvm/presentation/base/base_view_model.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //stream controller to handle view model outputs
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _list;
  int _currentIndex = 0;
  // OnBoarding ViewModel inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    // view model start your job
    _list = _getSliderData();
    _postDataToView();
  }

  @override
  int goNext() {
    int nextIndex = ++_currentIndex;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    return nextIndex;
  }

  @override
  int goPrevious() {
    int previousIndex = --_currentIndex;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;
  //onboarding view model outputs
  @override
  Stream<SliderViewObject> get outPutSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  // onboarding private function
  List<SliderObject> _getSliderData() {
    return [
      SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1,
          ImageAssets.onBoardingLogo1),
      SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2,
          ImageAssets.onBoardingLogo2),
      SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3,
          ImageAssets.onBoardingLogo3),
      SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingSubTitle4,
          ImageAssets.onBoardingLogo4),
    ];
  }

  void _postDataToView() {
    inputSliderViewObject.add(
        SliderViewObject(_list[_currentIndex], _list.length, _currentIndex));
  }
}

// inputs mean: orders that our view model will receive from view
abstract class OnBoardingViewModelInputs {
  int goNext(); // when user click right arrow or swipe left
  int goPrevious(); // when user click left arrow or swipe right
  void onPageChanged(int index);

  // stream controller inputs
  Sink get inputSliderViewObject;
}

abstract class OnBoardingViewModelOutputs {
  // stream controller outputs
  Stream<SliderViewObject> get outPutSliderViewObject;
}
