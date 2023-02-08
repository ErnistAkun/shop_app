import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';

class CategoryHeaderLabel extends StatelessWidget {
  const CategoryHeaderLabel({
    Key? key,
    required this.headerLabel,
  }) : super(key: key);
  final String headerLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 30,
        bottom: 30,
        top: 30,
        right: 130,
      ),
      child: Text(
        headerLabel,
        style: AppTextStyles.black16Bold,
      ),
    );
  }
}
