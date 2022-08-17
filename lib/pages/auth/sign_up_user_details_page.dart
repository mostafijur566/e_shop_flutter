import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';

class SignUpUserDetailsPage extends StatefulWidget {
  const SignUpUserDetailsPage({Key? key}) : super(key: key);

  @override
  State<SignUpUserDetailsPage> createState() => _SignUpUserDetailsPageState();
}

class _SignUpUserDetailsPageState extends State<SignUpUserDetailsPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController billingAddressController = TextEditingController();
  TextEditingController shippingAddressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
              emailController: nameController,
              hintText: 'Name',
              icon: Icons.person,
            ),
            SizedBox(
              height: 20,
            ),

            AppTextField(
              emailController: billingAddressController,
              hintText: 'Billing Address',
              icon: Icons.location_on,
            ),
            SizedBox(
              height: 20,
            ),
            AppTextField(
              emailController: shippingAddressController,
              hintText: 'Shipping Address',
              icon: Icons.location_on,
            ),
            SizedBox(
              height: 20,
            ),
            AppTextField(
              emailController: phoneController,
              hintText: 'Phone Number',
              icon: Icons.phone,
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
                    text: 'Sign Up',
                    color: Colors.white,
                    size: 26,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
