import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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

  File? image;

  final _picker = ImagePicker();

  Future getImage() async{
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);

    if(pickedFile != null){
      image = File(pickedFile.path);
      setState(() {

      });
    }
    else{

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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

              GestureDetector(
                onTap: (){
                  getImage();
                },
                child: Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(65),
                    color: Colors.grey[200],
                  ),
                  child: image == null ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        size: 60,
                        color: AppColors.mainColor,
                      ),
                      Text('Upload image', style: TextStyle(color: AppColors.mainColor),)
                    ],
                  ) : Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(65),
                      image: DecorationImage(
                        image:  FileImage(
                          File(image!.path).absolute,
                        ),
                        fit: BoxFit.cover
                      )
                    ),
                  )
                ),
              ),
              SizedBox(
                height: 20,
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
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
