import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';
import 'package:shop_app/app/presentation/main_screens/customer_screen.dart';
import 'package:shop_app/app/presentation/widgets/app_bar_widget/app_bar_back_button_widget.dart';
import 'package:shop_app/app/presentation/widgets/app_bar_widget/app_bar_title_widget.dart';

class CartSceen extends StatelessWidget {
  const CartSceen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.white,
        title: const AppBarTitleWidget(title: 'Cart'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete_forever,
                color: AppColors.black,
              ))
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Your Cart Is Empty!',
              style: AppTextStyles.black30,
            ),
            const SizedBox(
              height: 50,
            ),
            Material(
              color: AppColors.lightBlueAccent,
              borderRadius: BorderRadius.circular(25),
              child: MaterialButton(
                minWidth: MediaQuery.of(context).size.width * 0.6,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CustomerScreen(),
                    ),
                  );
                },
                child: Text(
                  "Continue shopping",
                  style: AppTextStyles.white18,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Total: \$',
                style: AppTextStyles.black18,
              ),
              Text(
                '00.00',
                style: AppTextStyles.red20Bold,
              ),
            ],
          ),
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: AppColors.yellow,
              borderRadius: BorderRadius.circular(25),
            ),
            child: MaterialButton(
              onPressed: () {},
              child: const Text('CHECK OUT'),
            ),
          ),
        ],
      ),
    );
  }
}
