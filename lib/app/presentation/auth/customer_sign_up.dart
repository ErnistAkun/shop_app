import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/app/constants/colors/app_colors.dart';
import 'package:shop_app/app/constants/decoration/app_decoration.dart';
import 'package:shop_app/app/constants/text_styles/app_text_styles.dart';
import 'package:shop_app/app/presentation/auth/auth_widget/auth_main_button_widget.dart';
import 'package:shop_app/app/presentation/auth/auth_widget/have_accout_widget.dart';
import 'package:shop_app/app/presentation/auth/auth_widget/snack_bar_widget.dart/my_message_handler.dart';
import 'package:shop_app/app/presentation/widgets/auth_widgets/text_form_field_widget.dart';

class CustomerSignUp extends StatefulWidget {
  const CustomerSignUp({Key? key}) : super(key: key);

  @override
  _CustomerSignUpState createState() => _CustomerSignUpState();
}

class _CustomerSignUpState extends State<CustomerSignUp> {
  final ImagePicker _picker = ImagePicker();
  late String _name;
  late String _email;
  late String _password;
  late String _uid;
  late String _profileImage;

  bool processing = false;

  bool passwordVisible = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();
  XFile? _imageFile;
  dynamic _pickedImageError;
  void _pickImageFromCamera() async {
    try {
      final _pickedImage = await _picker.pickImage(
        imageQuality: 95,
        maxHeight: 300,
        maxWidth: 300,
        source: ImageSource.camera,
      );

      setState(() {
        _imageFile = _pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      log(_pickedImageError);
    }
  }

  void _pickImageFromGallery() async {
    try {
      final _pickedImage = await _picker.pickImage(
        imageQuality: 95,
        maxHeight: 300,
        maxWidth: 300,
        source: ImageSource.gallery,
      );
      setState(() {
        _imageFile = _pickedImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      log(_pickedImageError);
    }
  }

  CollectionReference customers =
      FirebaseFirestore.instance.collection('customers');
  void signUp() async {
    setState(() {
      processing = true;
    });
    if (_formKey.currentState!.validate()) {
      if (_imageFile != null) {
        try {
          final credential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: _email,
            password: _password,
          );

          firebase_storage.Reference ref = firebase_storage
              .FirebaseStorage.instance
              .ref('cust-images/$_email.jpg');
          await ref.putFile(File(_imageFile!.path));
          _profileImage = await ref.getDownloadURL();
          _uid = FirebaseAuth.instance.currentUser!.uid;
          customers.doc(_uid).set({
            'name': _name,
            'email': _email,
            'phone': '',
            'address': '',
            'profileImage': _profileImage,
            'cid': _uid,
          });

          Navigator.pushReplacementNamed(context, '/customer_login');
          _formKey.currentState!.reset();
          setState(
            () {
              _imageFile = null;
            },
          );
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            setState(() {
              processing = false;
            });
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'The password provided is too weak.');
            log('The password provided is too weak.');
          } else if (e.code == 'email-already-in-use') {
            setState(() {
              processing = false;
            });
            MyMessageHandler.showSnackBar(
                _scaffoldKey, 'The account already exists for that email.');
            log('The account already exists for that email.');
          }
        } catch (e) {
          log("$e");
        }
      } else {
        MyMessageHandler.showSnackBar(
          _scaffoldKey,
          'Please pick an image first',
        );
      }
    } else {
      ///
      setState(() {
        processing = false;
      });
      log('not valid');
      MyMessageHandler.showSnackBar(
        _scaffoldKey,
        'Not valid',
      );
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 30,
                            horizontal: 40,
                          ),
                          child: CircleAvatar(
                            backgroundImage: _imageFile == null
                                ? null
                                : FileImage(
                                    File(_imageFile!.path),
                                  ),
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
                                  _pickImageFromCamera();
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
                            // bottom galery icon
                            Container(
                              decoration:
                                  AppDecoration.purple15BottomDecoration,
                              child: IconButton(
                                onPressed: () {
                                  _pickImageFromGallery();
                                  log('Pick image frome gallery');
                                },
                                icon: const Icon(
                                  Icons.photo,
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
                            actionLabel: 'Log In',
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, '/customer_login');
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 55.0,
                    ),
                    processing == true
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.purple,
                            ),
                          )
                        : AuthMainButtonWidget(
                            mainButtonLabel: 'Sign Up',
                            onTap: () {
                              signUp();
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
