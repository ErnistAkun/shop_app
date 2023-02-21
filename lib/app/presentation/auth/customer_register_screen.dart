import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/decoration/app_decoration.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';
import 'package:shop_app/app/presentation/auth/auth_widget/auth_main_button_widget.dart';
import 'package:shop_app/app/presentation/auth/auth_widget/have_accout_widget.dart';
import 'package:shop_app/app/presentation/widgets/auth_widgets/text_form_field_widget.dart';

class CustomerRegisterScreen extends StatefulWidget {
  const CustomerRegisterScreen({Key? key}) : super(key: key);

  @override
  _CustomerRegisterScreenState createState() => _CustomerRegisterScreenState();
}

class _CustomerRegisterScreenState extends State<CustomerRegisterScreen> {
//   TextEditingController _nameController = TextEditingController();
// TextEditingController _emailController = TextEditingController();
// TextEditingController _passwordController = TextEditingController();
  late String _name;
  late String _email;
  late String _password;
  bool passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  void showSnackBar() {
    _scaffoldKey.currentState!.showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 3),
        backgroundColor: AppColors.yellow,
        content: Text(
          'Pleas fill your fields',
          style: TextStyle(
            fontSize: 18,
            color: AppColors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: true,
              child: Form(
                key: _formKey,
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
                              decoration:
                                  AppDecoration.purple15BottomDecoration,
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
                            // controller: _nameController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your full name';
                              }
                              // _name = _nameController.text;
                              return null;
                            },
                            onChanged: (value) {
                              _name = value;
                            },
                            hintText: 'Enter your full name',
                            labelText: 'Full name',
                            keyBoardType: TextInputType.text,
                          ),
                          const SizedBox(height: 15.0),
                          TextFormFieldWidget(
                            // controller: _emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your email';
                              } else if (value.isValidEmail() == false) {
                                return 'invalid email';
                              } else if (value.isValidEmail() == true) {
                                // _email = _emailController.text;
                                return null;
                              }

                              return null;
                            },
                            onChanged: (value) {
                              _email = value;
                            },
                            hintText: 'Enter your email',
                            labelText: 'Email',
                            keyBoardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 15.0),
                          TextFormFieldWidget(
                            // controller: _passwordController,
                            obscureText: passwordVisible
                                ? passwordVisible = false
                                : passwordVisible = true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'please enter your password';
                              }
                              // _password = _passwordController.text;
                              return null;
                            },
                            onChanged: (value) {
                              _password = value;
                            },
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
                    AuthMainButtonWidget(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          log('valid');
                          log(_name);
                          log(_email);
                          log(_password);
                        } else {
                          log('not valid');
                          showSnackBar();
                        }
                      },
                      mainButtonLabel: 'Sign Up',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^([a-zA-Z0-9]+)([\-\_\.]*)([a-zA-Z0-9]*)([@])([a-zA-Z0-9]{2,})([\. ])([a-zA-Z]{2,3})$')
        .hasMatch(this);
  }
}
