import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
                      // recognizer: TapGestureRecognizer()..onTap = () => Get.to(() => SignUpPage()),
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
  }
}
