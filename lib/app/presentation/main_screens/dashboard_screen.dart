import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';
import 'package:shop_app/app/presentation/dashboard_components/balance.dart';
import 'package:shop_app/app/presentation/dashboard_components/edit_profile.dart';
import 'package:shop_app/app/presentation/dashboard_components/manage_products.dart';
import 'package:shop_app/app/presentation/dashboard_components/my_store.dart';
import 'package:shop_app/app/presentation/dashboard_components/orders.dart';
import 'package:shop_app/app/presentation/dashboard_components/statics.dart';
import 'package:shop_app/app/presentation/widgets/app_bar_widget/app_bar_title_widget.dart';
import 'package:shop_app/app/utilities/dashboard_list.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        title: const AppBarTitleWidget(
          title: 'Dashboard',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/welcome_screen');
            },
            icon: const Icon(
              Icons.logout,
              color: AppColors.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => pages[index],
                  ),
                );
              },
              child: Card(
                  elevation: 20,
                  shadowColor: AppColors.purpleAccent,
                  color: AppColors.blueGrey07,
                  child: Column(
                    children: [
                      Icon(
                        icons[index],
                        size: 50,
                        color: AppColors.yellow,
                      ),
                      Text(
                        label[index].toUpperCase(),
                        style: AppTextStyles.yellowAccent24w600Acme,
                      )
                    ],
                  )),
            );
          }),
        ),
      ),
    );
  }
}
