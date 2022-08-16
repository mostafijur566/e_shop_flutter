import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/app_colors.dart';
import '../utils/theme.dart';
import '../widgets/account_widget.dart';
import '../widgets/app_icon.dart';
import '../widgets/big_text.dart';
import '../widgets/button.dart';
import '../widgets/input_field.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        width: double.maxFinite,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: AppIcon(
                  icon: Icons.person,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: 45 + 30,
                  size: 120,
                ),
              ),
              MyInputField(
                title: "Name",
                hint: "Enter your full name",
              ),
              MyInputField(
                title: "Billing Address",
                hint: "Billing Address",
              ),
              MyInputField(
                title: "Shipping Address",
                hint: "Shipping Address",
              ),
              MyInputField(
                title: "Phone number",
                hint: "Phone number",
              ),
              SizedBox(
                height: 20,
              ),
              MyButton(label: "Save",
                  onTap: () {

                  },
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 12, bottom: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(FontAwesomeIcons.rightFromBracket, color: Colors.white,),
                    SizedBox(width: 10,),
                    Text('Sign Out', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),)
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.red
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
