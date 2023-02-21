import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/decoration/app_decoration.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';
import 'package:shop_app/app/presentation/auth/auth_widget/have_accout_widget.dart';
import 'package:shop_app/app/presentation/widgets/auth_widgets/text_form_field_widget.dart';

class CustomerRegisterScreen extends StatefulWidget {
  const CustomerRegisterScreen({Key? key}) : super(key: key);

  @override
  _CustomerRegisterScreenState createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {
  bool passwordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            reverse: true,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Sign Up',
                        style: AppTextStyles.black40Bold,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            '/welcome_screen',
                          );
                        },
                        icon: const Icon(
                          Icons.home_work,
                          size: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    // CircleAvatar purpleAccent
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 40,
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: AppColors.purpleAccent,
                      ),
                    ),
                    Column(
                      children: [
                        // top camera icon
                        Container(
                          decoration: AppDecoration.purple15TopDecoration,
                          child: IconButton(
                            onPressed: () {
                              log('Pick image frome camera');
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        // bottom camera icon
                        Container(
                          decoration: AppDecoration.purple15BottomDecoration,
                          child: IconButton(
                            onPressed: () {
                              log('Pick image frome gallery');
                            },
                            icon: const Icon(
                              Icons.camera_alt,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // TextFormFieldWidget
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      TextFormFieldWidget(
                        validator: (value) {},
                        onChanged: (value) {},
                        hintText: 'Enter your full name',
                        labelText: 'Full name',
                        keyBoardType: TextInputType.text,
                      ),
                      const SizedBox(height: 15.0),
                      TextFormFieldWidget(
                        validator: (value) {},
                        onChanged: (value) {},
                        hintText: 'Enter your email',
                        labelText: 'Email',
                        keyBoardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 15.0),
                      TextFormFieldWidget(
                        obscureText: passwordVisible
                            ? passwordVisible = false
                            : passwordVisible = true,
                        validator: (value) {},
                        onChanged: (value) {},
                        hintText: 'Enter your password',
                        labelText: 'Password',
                        keyBoardType: TextInputType.number,
                        widget: IconButton(
                          onPressed: () {
                            setState(() {
                              passwordVisible = passwordVisible;
                            });
                          },
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35.0,
                      ),
                      HaveAccountWidget(
                        haveAccount: 'already have account?',
                        onTap: () {},
                        actionLabel: 'Log In',
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 55.0,
                ),
                Container(
                  height: 40.0,
                  width: MediaQuery.of(context).size.width * 0.90,
                  decoration: AppDecoration.purple20Decoration,
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: AppTextStyles.white20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
