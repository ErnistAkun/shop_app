import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';
import 'package:shop_app/app/presentation/auth/auth_widget/auth_main_button_widget.dart';
import 'package:shop_app/app/presentation/auth/auth_widget/have_accout_widget.dart';
import 'package:shop_app/app/presentation/auth/auth_widget/snack_bar_widget.dart/my_message_handler.dart';
import 'package:shop_app/app/presentation/widgets/auth_widgets/text_form_field_widget.dart';

class CustomerLogin extends StatefulWidget {
  const CustomerLogin({Key? key}) : super(key: key);

  @override
  _CustomerLoginState createState() => _CustomerLoginState();
}

class _CustomerLoginState extends State<CustomerLogin> {
  late String _email;
  late String _password;
  bool processing = false;
  bool passwordVisible = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');
  void logIn() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
        _formKey.currentState!.reset();
        Navigator.pushReplacementNamed(context, '/customer_screen');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          MyMessageHandler.showSnackBar(
              _scaffoldKey, 'No user found for that email.');
        } else if (e.code == 'wrong-password') {
          MyMessageHandler.showSnackBar(
              _scaffoldKey, 'Wrong password provided for that user.');
        }
      }
    } else {
      ///
      setState(() {
        processing = false;
      });

      MyMessageHandler.showSnackBar(_scaffoldKey, 'Not valid');
    }
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
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Log In',
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
                    // TextFormFieldWidget
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
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
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 200,
                              top: 20,
                            ),
                            child: TextButton(
                              onPressed: () {},
                              child: Text(
                                'Forget Password',
                                style: AppTextStyles.black18Italic,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 35.0,
                          ),
                          HaveAccountWidget(
                            haveAccount: 'Don\'t Have Account?',
                            actionLabel: 'Sign Up',
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/customer_sign_up');
                            },
                          ),
                        ],
                      ),
                    ),

                    processing == true
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.purple,
                            ),
                          )
                        : AuthMainButtonWidget(
                            mainButtonLabel: 'Log In',
                            onTap: () {
                              logIn();
                            },
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
