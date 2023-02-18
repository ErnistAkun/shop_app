import 'package:flutter/material.dart';
import 'package:shop_app/app/categories/accessories_category.dart';
import 'package:shop_app/app/categories/bags_category.dart';
import 'package:shop_app/app/categories/beauty_category.dart';
import 'package:shop_app/app/categories/electronics_category.dart';
import 'package:shop_app/app/categories/home_and_garden_category.dart';
import 'package:shop_app/app/categories/kids_category.dart';
import 'package:shop_app/app/categories/men_category.dart';
import 'package:shop_app/app/categories/shoes_category.dart';
import 'package:shop_app/app/categories/women_category.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/presentation/widgets/fake_search_widget.dart';

List<ItemsData> items = [
  ItemsData(label: 'men'),
  ItemsData(label: 'women'),
  ItemsData(label: 'shoes'),
  ItemsData(label: 'bags'),
  ItemsData(label: 'electronics'),
  ItemsData(label: 'accessories'),
  ItemsData(label: 'home & garden'),
  ItemsData(label: 'kids'),
  ItemsData(label: 'beauty'),
];

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    for (var element in items) {
      element.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });
    super.initState();
  }

  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: const FakeSearchWidget(),
      ),
      body: Stack(
        children: [
          Positioned(bottom: 0, left: 0, child: sideNavigator(size)),
          Positioned(bottom: 0, right: 0, child: categoryView(size)),
        ],
      ),
    );
  }

  Widget sideNavigator(Size size) {
    return SizedBox(
      height: size.height * 0.8,
      width: size.width * 0.2,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                for (var element in items) {
                  element.isSelected = false;
                }
                items[index].isSelected = true;
              });
              // _pageController.jumpToPage(index);
              _pageController.animateToPage(
                index,
                duration: Duration(microseconds: 100),
                curve: Curves.bounceIn,
              );
            },
            child: Container(
              height: 100,
              color: items[index].isSelected == true
                  ? AppColors.white
                  : AppColors.greyShade300,
              child: Center(
                child: Text(items[index].label),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget categoryView(Size size) {
    return Container(
      color: AppColors.white,
      height: size.height * 0.8,
      width: size.width * 0.8,
      child: PageView(
        onPageChanged: (value) {
          for (var sideBarIndex in items) {
            sideBarIndex.isSelected = false;
          }
          setState(() {
            items[value].isSelected = true;
          });
        },
        controller: _pageController,
        scrollDirection: Axis.vertical,
        children: [
          MenCategory(),
          WomenCategory(),
          ShoesCategory(),
          BagsCategory(),
          ElectronicsCategory(),
          AccessoriesCategory(),
          HomeAndGarden(),
          KidsCategory(),
          BeautyCategory(),
        ],
      ),
    );
  }
}

class ItemsData {
  String label;
  bool isSelected;
  ItemsData({
    required this.label,
    this.isSelected = false,
  });
}
