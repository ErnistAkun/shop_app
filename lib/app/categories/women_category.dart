import 'package:flutter/material.dart';
import 'package:shop_app/app/presentation/widgets/category_widgets/category_header_lable.dart';
import 'package:shop_app/app/presentation/widgets/category_widgets/slider_widget.dart';
import 'package:shop_app/app/presentation/widgets/category_widgets/sub_category_model.dart';
import 'package:shop_app/app/utilities/categ_list.dart';

class WomenCategory extends StatelessWidget {
  WomenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Column(
            children: [
              const CategoryHeaderLabel(
                headerLabel: 'Women',
              ),
              Expanded(
                child: GridView.count(
                    mainAxisSpacing: 70,
                    crossAxisSpacing: 15,
                    crossAxisCount: 2,
                    children: List.generate(women.length, (index) {
                      return SubCaregoryModel(
                        mainCategoryName: "women",
                        subCategoryName: women[index],
                        assetName: 'images/women/women$index.jpg',
                        subCategoryLable: women[index],
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
            mainSliderText: 'women',
          ),
        ),
      ],
    );
  }
}
