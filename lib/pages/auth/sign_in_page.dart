import 'package:e_shop_flutter/pages/auth/sign_up_page.dart';
import 'package:e_shop_flutter/pages/home_page.dart';
import 'package:e_shop_flutter/pages/nav_bar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../controller/auth_controller.dart';
import '../../models/signin_body.dart';
import '../../utils/app_colors.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';
import 'package:get/get.dart';
import 'package:e_shop_flutter/helper/dependencies.dart' as dep;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }


  void _login(AuthController authController) async{

    String email = emailController.text.toLowerCase().trim();
    String password = passwordController.text;

    if (email.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Email field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (password.isEmpty) {
      Get.snackbar(
        'Oops!',
        'Password field cannot be empty!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if (password.length <= 6) {
      Get.snackbar(
        'Oops!',
        'Password length should be at least 6 character!',
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else{
      SignInBody signInBody = SignInBody(username: email, password: password);
      authController.login(signInBody).then((status)  async{
        if(status.isSuccess){
          await dep.init();
          Get.off(NavBar());
        }
        else{
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<AuthController>(builder: (_authController){
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

                  Container(
                    width: double.maxFinite,
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello',
                          style: TextStyle(
                              fontSize: 20 * 3 + 20 / 2,
                              fontWeight: FontWeight.bold
                          ),
                        ),

                        Text('Sign into your account',
                          style: TextStyle(
                              fontSize: 20 ,
                              color: Colors.grey[500]
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
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
                      _login(_authController);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 13,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.mainColor),
                      child: Center(
                        child: BigText(
                          text: 'Sign In',
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        children: [
                          TextSpan(
                            recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => SignUpPage()),
                            text: ' Create',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                            ),),
                        ]
                    ),

                  ),

                ],
              ),
            ),
          );
        },)
      ),
    );
  }
}
