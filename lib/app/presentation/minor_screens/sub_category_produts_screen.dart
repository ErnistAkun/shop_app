import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';

class SubCategoryProdutsScreen extends StatelessWidget {
  const SubCategoryProdutsScreen({
    Key? key,
    required this.subCategoryName,
    required this.mainCategoryName,
  }) : super(key: key);
  final String? subCategoryName;
  final String? mainCategoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.black,
          ),
        ),
        title: Text(
          subCategoryName!,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Text(
          mainCategoryName!,
        ),
      ),
    );
  }
}
