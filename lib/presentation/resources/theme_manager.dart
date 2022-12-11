import 'package:flutter/material.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/color_manager.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/font_manager.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/styles_manager.dart';
import 'package:flutter_clean_arch_mvvm/presentation/resources/values_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      // main color
      primaryColor: ColorManager.primary,
      primaryColorLight: ColorManager.lightPrimary,
      primaryColorDark: ColorManager.darkPrimary,
      disabledColor: ColorManager.grey1,
      splashColor: ColorManager.lightPrimary,
      // card view theme
      cardTheme: CardTheme(
          color: ColorManager.white,
          shadowColor: ColorManager.grey,
          elevation: AppSize.size4),
      //app bar theme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.size4,
        shadowColor: ColorManager.lightPrimary,
        titleTextStyle: getRegularStyle(
            color: ColorManager.white, fontSize: FontSize.size16),
      ),
      //button theme
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManager.grey1,
        buttonColor: ColorManager.primary,
        splashColor: ColorManager.lightPrimary,
      ),
      // elevated button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(
            color: ColorManager.white, fontSize: FontSize.size17),
        backgroundColor: ColorManager.primary,
        // primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            AppSize.size12,
          ),
        ),
      )),
      // text theme
      textTheme: TextTheme(
        displayLarge:getLightStyle(color: ColorManager.white, fontSize: FontSize.size22),
        displayMedium: getSemiBoldStyle(color: ColorManager.darkGrey, fontSize: FontSize.size16),
        titleLarge: getMediumStyle(color: ColorManager.lightGrey, fontSize: FontSize.size14),
        bodyMedium: getRegularStyle(color: ColorManager.grey1),
        titleSmall: getRegularStyle(color: ColorManager.grey),

        // headline1: getSemiBoldStyle(
        //     color: ColorManager.darkGrey, fontSize: FontSize.size16),
        // subtitle1: getMediumStyle(
        //     color: ColorManager.lightGrey, fontSize: FontSize.size14),
        // caption: getRegularStyle(color: ColorManager.grey1),
        // bodyText1: getRegularStyle(color: ColorManager.grey),
      ),
      //input decoration theme(text form feild)
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(AppPadding.padding8),
        hintStyle: getRegularStyle(
          color: ColorManager.grey,
          fontSize: FontSize.size14,
        ),
        labelStyle: getMediumStyle(
          color: ColorManager.grey,
          fontSize: FontSize.size14,
        ),
        errorStyle: getMediumStyle(
          color: ColorManager.error,
          fontSize: FontSize.size14,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.grey,
              width: AppSize.size1_5,
            ),
            borderRadius:
                const BorderRadius.all(Radius.circular(AppSize.size8))),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.primary,
              width: AppSize.size1_5,
            ),
            borderRadius:
                const BorderRadius.all(Radius.circular(AppSize.size8))),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.error,
              width: AppSize.size1_5,
            ),
            borderRadius:
                const BorderRadius.all(Radius.circular(AppSize.size8))),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ColorManager.primary,
              width: AppSize.size1_5,
            ),
            borderRadius:
                const BorderRadius.all(Radius.circular(AppSize.size8))),
      ));
}
