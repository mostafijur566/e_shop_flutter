import 'package:e_shop_flutter/controller/auth_controller.dart';
import 'package:e_shop_flutter/pages/auth/sign_in_page.dart';
import 'package:e_shop_flutter/pages/auth/sign_up_user_details_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../models/signup_body.dart';
import '../../utils/app_colors.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  void _registration(AuthController authController){
    String email = emailController.text.toLowerCase().trim();
    String username = usernameController.text.trim();
    String password = passwordController.text;

    final isValid = EmailValidator.validate(email);

    if (email.isEmpty) {
      Get.snackbar(
        'Required!',
        'Email field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (!isValid) {
      Get.snackbar(
        'Invalid!',
        'Please enter a valid email address!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (username.isEmpty) {
      Get.snackbar(
        'Required!',
        'Username field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (password.isEmpty) {
      Get.snackbar(
        'Required!',
        'Password field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (password.length <= 6) {
      Get.snackbar(
        'Too short password!',
        'Password length should be at least 6 character!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else{
      SignUpBody signUpBody = SignUpBody(email: email, username: username, password: password);
      authController.registration(signUpBody).then((status) async{
        if(status.isSuccess){
          Get.to(SignUpUserDetailsPage(user: username,));
        }
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder<AuthController>(builder: (_authController){
          return ModalProgressHUD(
            inAsyncCall: _authController.isLoading,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Hero(
                    tag: 'logo',
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Center(
                          child: Image.asset('assets/images/logo.png',
                            width: 170,
                          )
                      ),
                    ),
                  ),
                  AppTextField(
                    emailController: emailController,
                    hintText: 'Email',
                    icon: Icons.email,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  AppTextField(
                    emailController: usernameController,
                    hintText: 'Username',
                    icon: Icons.person,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    emailController: passwordController,
                    hintText: 'Password',
                    icon: Icons.password_sharp,
                    hideText: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      _registration(_authController);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.mainColor),
                      child: Center(
                        child: BigText(
                          text: 'Next',
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      recognizer: TapGestureRecognizer()..onTap = () => Get.off(SignInPage()),
                      text: 'Have an account already?',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },),
      ),
    );
  }
}
