import 'package:flutter/material.dart';
import 'package:shop_app/app/presentation/minor_screens/sub_category_produts_screen.dart';

class SubCaregoryModel extends StatelessWidget {
  const SubCaregoryModel({
    Key? key,
    required this.subCategoryName,
    required this.mainCategoryName,
    required this.assetName,
    required this.subCategoryLable,
  }) : super(key: key);

  final String subCategoryName;
  final String mainCategoryName;
  final String assetName;
  final String subCategoryLable;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SubCategoryProdutsScreen(
              subCategoryName: subCategoryName,
              mainCategoryName: mainCategoryName,
            ),
          ),
        );
      },
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Image(
              image: AssetImage(assetName),
            ),
          ),
          Text(subCategoryLable),
        ],
      ),
    );
  }
}
