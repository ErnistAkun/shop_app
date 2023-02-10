import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';
import 'package:shop_app/app/presentation/minor_screens/sub_category_produts_screen.dart';
import 'package:shop_app/app/presentation/widgets/category_widgets/category_header_lable.dart';
import 'package:shop_app/app/presentation/widgets/category_widgets/slider_widget.dart';
import 'package:shop_app/app/presentation/widgets/category_widgets/sub_category_model.dart';
import 'package:shop_app/app/utilities/categ_list.dart';

class BagsCategory extends StatelessWidget {
  BagsCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Column(
            children: [
              const CategoryHeaderLabel(
                headerLabel: 'Bags',
              ),
              Expanded(
                child: GridView.count(
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: List.generate(bags.length, (index) {
                      return SubCaregoryModel(
                        mainCategoryName: "bags",
                        subCategoryName: bags[index],
                        assetName: 'images/bags/bags$index.jpg',
                        subCategoryLable: bags[index],
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
            mainSliderText: 'bags',
          ),
        ),
      ],
    );
  }
}
