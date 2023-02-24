import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';

class MyMessageHandler {
  static void showSnackBar(
    var _scaffoldKey,
    String message,
  ) {
    _scaffoldKey.currentState!.showSnackBar(
       SnackBar(
        duration: const Duration(seconds: 3),
        backgroundColor: AppColors.yellow,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
