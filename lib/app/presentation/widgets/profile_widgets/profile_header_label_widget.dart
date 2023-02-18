import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';

class ProfileHeaderLabelWidget extends StatelessWidget {
  const ProfileHeaderLabelWidget({
    super.key,
    required this.headerLebal,
  });
  final String headerLebal;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 50,
            height: 40,
            child: Divider(
              thickness: 1,
              color: AppColors.grey,
            ),
          ),
          Text(
            headerLebal,
            style: AppTextStyles.grey20Bold,
          ),
          const SizedBox(
            width: 50,
            height: 40,
            child: Divider(
              thickness: 1,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
