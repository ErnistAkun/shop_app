import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';

class AppDecoration {
  static const Decoration welcomDecoration = BoxDecoration(
    image: DecorationImage(
      fit: BoxFit.cover,
      image: AssetImage(
        'images/inapp/bgimage.jpg',
      ),
    ),
  );
  static const Decoration containerTextDecorationLeft = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(50),
      bottomLeft: Radius.circular(50),
    ),
    color: AppColors.white38,
  );
  static const Decoration containerTextDecorationRight = BoxDecoration(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(50),
      bottomRight: Radius.circular(50),
    ),
    color: AppColors.white38,
  );
  // 'Pick image frome gallery'
  static const Decoration purple15BottomDecoration = BoxDecoration(
    color: AppColors.purple,
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15),
    ),
  );
  // 'Pick image frome camera'
  static const Decoration purple15TopDecoration = BoxDecoration(
    color: AppColors.purple,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
  );
  // Sign Up button
  static Decoration purple20Decoration = BoxDecoration(
    color: AppColors.purple,
    borderRadius: BorderRadius.circular(20),
  );

  static Decoration yellowContainerDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: AppColors.yellow,
  );
}
