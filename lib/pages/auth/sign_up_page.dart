import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();

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
              height: 20,
            ),
            AppTextField(
              emailController: usernameController,
              hintText: 'Username',
              icon: Icons.person,
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                try {
                  setState(() {

                  });

                } catch (e) {

                }
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
                // recognizer: TapGestureRecognizer()..onTap = () => Get.back(),
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
  }
}
