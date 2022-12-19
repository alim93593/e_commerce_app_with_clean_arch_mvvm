import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/assets_manager.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/color_manager.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/constant_manager.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();

}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  startDelay(){
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), () {
      _goNext();
    });
  }
  _goNext() {
    Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startDelay();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer!.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: const Center(
        child: Image(
          image: AssetImage(
            ImageAssets.splashLogo,
          ),
        ),
      ),
    );
  }

}

