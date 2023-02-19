import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';

class AppBarBackButtonWidget extends StatelessWidget {
  const AppBarBackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: AppColors.black,
      ),
    );
  }
}
