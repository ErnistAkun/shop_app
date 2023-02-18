import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';

class YellowDividerWidget extends StatelessWidget {
  const YellowDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Divider(
        thickness: 1,
        color: AppColors.yellow,
      ),
    );
  }
}
