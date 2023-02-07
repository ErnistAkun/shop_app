import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';
import 'package:shop_app/app/presentation/minor_screens/sub_category_produts_screen.dart';
import 'package:shop_app/app/presentation/widgets/category_widgets/category_header_lable.dart';
import 'package:shop_app/app/presentation/widgets/category_widgets/sub_category_model.dart';
import 'package:shop_app/app/utilities/categ_list.dart';

class KidsCategory extends StatelessWidget {
  KidsCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Column(
            children: [
              const CategoryHeaderLabel(
                headerLabel: 'Kids',
              ),
              Expanded(
                child: GridView.count(
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: List.generate(kids.length, (index) {
                      return SubCaregoryModel(
                        mainCategoryName: "kids",
                        subCategoryName: kids[index],
                        assetName: 'images/kids/kids$index.jpg',
                        subCategoryLable: kids[index],
                      );
                    })),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
