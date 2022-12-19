// ignore_for_file: unused_field, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_arch_mvvm/domain/models.dart';
import 'package:flutter_clean_arch_mvvm/presentation/on_boarding/viewmodel/onboarding_viewmodel.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/color_manager.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/constant_manager.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/strings_manager.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/values_manager.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../resources/routes_manager.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _viewModel.outPutSliderViewObject,
      builder: (context, snapshot) {
        return _getContentWidget(snapshot.data);
      },
    );
  }

  Widget _getContentWidget(SliderViewObject? sliderViewObject) {
    if (sliderViewObject == null) {
      return Container();
    } else {
      return Scaffold(
        backgroundColor: ColorManager.white,
        appBar: AppBar(
          backgroundColor: ColorManager.white,
          elevation: AppSize.size_0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: sliderViewObject.numberOfSlides,
          onPageChanged: (index) {
            _viewModel.onPageChanged(index);
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(sliderViewObject.sliderObject);
          },
        ),
        bottomSheet: Container(
          color: ColorManager.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.loginRoute);
                  },
                  child: Text(
                    AppStrings.skip,
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              _getBottomSheetWidget(sliderViewObject),
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheetWidget(SliderViewObject? sliderViewObject) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // left arrow
          Padding(
            padding: EdgeInsets.all(
              AppPadding.padding14,
            ),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.size20,
                height: AppSize.size20,
                child: SvgPicture.asset(ImageAssets.leftArrow),
              ),
              onTap: () {
                // go to previous slide
                _pageController.animateToPage(_viewModel.goPrevious(),
                    duration: const Duration(
                        milliseconds: AppConstants.sliderAnimation),
                    curve: Curves.easeInOut);
              },
            ),
          ),

          Row(
            children: [
              for (int i = 0; i < sliderViewObject!.numberOfSlides; i++)
                Padding(
                  padding: EdgeInsets.all(
                    AppPadding.padding8,
                  ),
                  child: _getFunctionProperCircle(
                      i, sliderViewObject.currentIndex),
                )
            ],
          ),
          //right arrow
          Padding(
            padding: EdgeInsets.all(
              AppPadding.padding14,
            ),
            child: GestureDetector(
              child: SizedBox(
                width: AppSize.size20,
                height: AppSize.size20,
                child: SvgPicture.asset(ImageAssets.rightArrow),
              ),
              onTap: () {
                // go to next slide
                _pageController.animateToPage(_viewModel.goNext(),
                    duration: const Duration(
                        milliseconds: AppConstants.sliderAnimation),
                    curve: Curves.easeInOut);
              },
            ),
          )
        ],
      ),
    );
  }

  _getFunctionProperCircle(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCirlce);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircle);
    }
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject? _sliderObject;
  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.size40),
        Padding(
          padding: const EdgeInsets.all(AppPadding.padding8),
          child: Text(
            _sliderObject!.title.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.padding8),
          child: Text(
            _sliderObject!.subTitle.toString(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        const SizedBox(height: AppSize.size60),
        SvgPicture.asset(_sliderObject!.image.toString())
      ],
    );
  }
}
