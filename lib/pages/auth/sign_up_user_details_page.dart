import 'dart:io';
import 'package:e_shop_flutter/controller/auth_controller.dart';
import 'package:e_shop_flutter/pages/auth/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../utils/app_colors.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/big_text.dart';

class SignUpUserDetailsPage extends StatefulWidget {
  const SignUpUserDetailsPage({Key? key, required this.user}) : super(key: key);
  final user;

  @override
  State<SignUpUserDetailsPage> createState() => _SignUpUserDetailsPageState();
}

class _SignUpUserDetailsPageState extends State<SignUpUserDetailsPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController billingAddressController = TextEditingController();
  TextEditingController shippingAddressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // File? image;
  //
  // final _picker = ImagePicker();
  //
  // Future getImage() async{
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
  //
  //   if(pickedFile != null){
  //     image = File(pickedFile.path);
  //     print(image);
  //     setState(() {
  //
  //     });
  //   }
  //   else{
  //
  //   }
  // }

  void _registration(AuthController authController){
    String name = nameController.text.trim();
    String billingAddress = billingAddressController.text.trim();
    String shippingAddress = shippingAddressController.text.trim();
    String phone = phoneController.text.trim();

    if(name.isEmpty){
      Get.snackbar(
        'Cannot be empty!',
        'Name field cannot be empty!',
        icon: Icon(Icons.person),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if(billingAddress.isEmpty){
      Get.snackbar(
        'Cannot be empty!',
        'Billing Address field cannot be empty!',
        icon: Icon(Icons.person),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if(shippingAddress.isEmpty){
      Get.snackbar(
        'Cannot be empty!',
        'Shipping Address field cannot be empty!',
        icon: Icon(Icons.person),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else if(phone.isEmpty){
      Get.snackbar(
        'Cannot be empty!',
        'Name field cannot be empty!',
        icon: Icon(Icons.person),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    }

    else{
      authController.uploadUserData(widget.user, name, billingAddress, shippingAddress, phone).then((status) async{
        if(status.isSuccess){
          Get.to(SignInPage());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<AuthController>(builder: (_authController){
        return ModalProgressHUD(
          inAsyncCall: _authController.isLoading,
          child: SafeArea(
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
                      _authController.pickedImage();
                    },
                    child: Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(65),
                          color: Colors.grey[200],
                        ),
                        child: _authController.pickedFile == null ? Column(
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
                                    File(_authController.pickedFile!.path).absolute,
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
      },)
    );
  }
}
