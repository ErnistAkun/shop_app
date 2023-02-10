import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';
import 'package:shop_app/app/presentation/minor_screens/sub_category_produts_screen.dart';
import 'package:shop_app/app/presentation/widgets/category_widgets/category_header_lable.dart';
import 'package:shop_app/app/presentation/widgets/category_widgets/slider_widget.dart';
import 'package:shop_app/app/presentation/widgets/category_widgets/sub_category_model.dart';
import 'package:shop_app/app/utilities/categ_list.dart';

class ShoesCategory extends StatelessWidget {
  ShoesCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Column(
            children: [
              const CategoryHeaderLabel(
                headerLabel: 'Shoes',
              ),
              Expanded(
                child: GridView.count(
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: List.generate(shoes.length, (index) {
                      return SubCaregoryModel(
                        mainCategoryName: "shoes",
                        subCategoryName: shoes[index],
                        assetName: 'images/shoes/shoes$index.jpg',
                        subCategoryLable: shoes[index],
                      );
                    })),
              ),
            ],
          ),
        ),
        const Positioned(
          bottom: 0,
          right: 0,
          child: SliderWidget(
            mainSliderText: 'shoes',
          ),
        ),
      ],
    );
  }
}
