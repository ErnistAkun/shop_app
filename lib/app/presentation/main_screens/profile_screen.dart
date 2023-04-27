import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';
import 'package:shop_app/app/presentation/customer_screens/customer_order_screen.dart';
import 'package:shop_app/app/presentation/customer_screens/customer_wishlist_screen.dart';
import 'package:shop_app/app/presentation/main_screens/cart_screen.dart';
import 'package:shop_app/app/presentation/widgets/profile_widgets/profile_header_label_widget.dart';
import 'package:shop_app/app/presentation/widgets/profile_widgets/repeated_list_tile_widget.dart';
import 'package:shop_app/app/presentation/widgets/profile_widgets/yellow_divider_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greyShade300,
      body: Stack(
        children: [
          Container(
            height: 190,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.yellow,
                  AppColors.brown,
                ],
              ),
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                elevation: 0,
                centerTitle: true,
                backgroundColor: AppColors.white,
                expandedHeight: 120,
                flexibleSpace: LayoutBuilder(
                  builder: (context, constraint) {
                    return FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        duration: const Duration(milliseconds: 500),
                        opacity: constraint.biggest.height <= 100 ? 1 : 0,
                        child: const Text(
                          'Account',
                          style: TextStyle(
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      background: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.yellow,
                              AppColors.brown,
                            ],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 25,
                            left: 30,
                          ),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundImage:
                                    AssetImage('images/inapp/guest.jpg'),
                              ),
                              Text(
                                'Guest'.toUpperCase(),
                                style: AppTextStyles.black24w600,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 80,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.black54,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const CartSceen(),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Center(
                                  child: Text(
                                    "Cart",
                                    style: AppTextStyles.yellowk20Bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            color: AppColors.yellow,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomerOrderScreen(),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Center(
                                  child: Text(
                                    "Orders",
                                    style: AppTextStyles.black54Bold20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.black54,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CustomerWishlistScreen(),
                                  ),
                                );
                              },
                              child: SizedBox(
                                height: 40,
                                width: MediaQuery.of(context).size.width * 0.2,
                                child: Center(
                                  child: Text(
                                    "Wishlist",
                                    style: AppTextStyles.yellowk20Bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: AppColors.greyShade300,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 150,
                            child: Image(
                              image: AssetImage("images/inapp/logo.jpg"),
                            ),
                          ),
                          const ProfileHeaderLabelWidget(
                              headerLebal: '  Account Info.  '),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: 260,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  const RepeatedListTileWidget(
                                    icon: Icons.email,
                                    title: 'Email Address',
                                    subTitle: 'akunzhanovernist@gmail.com',
                                  ),
                                  const YellowDividerWidget(),
                                  const RepeatedListTileWidget(
                                    icon: Icons.phone,
                                    title: 'Phone Number',
                                    subTitle: '+996 556 542 556',
                                  ),
                                  const YellowDividerWidget(),
                                  RepeatedListTileWidget(
                                    onPressed: () {},
                                    icon: Icons.location_pin,
                                    title: 'Address',
                                    subTitle: 'Osh, Uzgen',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const ProfileHeaderLabelWidget(
                              headerLebal: '  Account Settings  '),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              height: 260,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                children: [
                                  RepeatedListTileWidget(
                                    onPressed: () {},
                                    icon: Icons.edit,
                                    title: 'Edit Profile',
                                  ),
                                  const YellowDividerWidget(),
                                  RepeatedListTileWidget(
                                    onPressed: () {},
                                    icon: Icons.lock,
                                    title: 'Change Password',
                                  ),
                                  const YellowDividerWidget(),
                                  RepeatedListTileWidget(
                                    icon: Icons.logout,
                                    title: 'Log Out',
                                    onPressed: () async {
                                      await FirebaseAuth.instance.signOut();
                                      Navigator.pushReplacementNamed(
                                          context, '/welcome_screen');
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
