import 'package:e_shop_flutter/utils/app_colors.dart';
import 'package:e_shop_flutter/widgets/big_text.dart';
import 'package:e_shop_flutter/widgets/button.dart';
import 'package:e_shop_flutter/widgets/input_field.dart';
import 'package:e_shop_flutter/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {

  int _value = 3;

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        title: BigText(text: "Payment", color: AppColors.mainBlackColor,),
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: (){
            Get.back();
          },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColors.mainBlackColor,),
        ),
      ),


      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Radio(
                        activeColor: AppColors.mainColor,
                        value: 1,
                        groupValue: _value,
                        onChanged: (value){
                          setState(() {
                            _value = int.parse(value.toString());
                          });
                        }
                        ),
                    SmallText(text: 'Cash on Delivery', size: 18, color: AppColors.mainBlackColor,),
                    SizedBox(width: 20,),
                    Icon(FontAwesomeIcons.wallet),

                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    ]
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Radio(
                      activeColor: AppColors.mainColor,
                        value: 2,
                        groupValue: _value,
                        onChanged: (value){
                          setState(() {
                            _value = int.parse(value.toString());
                          });
                        }
                    ),

                    SmallText(text: 'bKash', size: 18, color: AppColors.mainBlackColor,),
                    SizedBox(width: 20,),
                    Image.asset('assets/images/bkash.png', height: 30,),

                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    ]
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Radio(
                        activeColor: AppColors.mainColor,
                        value: 3,
                        groupValue: _value,
                        onChanged: (value){
                          setState(() {
                            _value = int.parse(value.toString());
                          });
                        }
                    ),
                    SmallText(text: 'Nagad', size: 18, color: AppColors.mainBlackColor,),
                    SizedBox(width: 20,),
                    Image.asset('assets/images/nagad.png', height: 30,),

                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    ]
                ),
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Radio(
                        activeColor: AppColors.mainColor,
                        value: 4,
                        groupValue: _value,
                        onChanged: (value){
                          setState(() {
                            _value = int.parse(value.toString());
                          });
                        }
                    ),

                    SmallText(text: 'Cards', size: 18, color: AppColors.mainBlackColor,),
                    SizedBox(width: 20,),
                    Image.asset('assets/images/cards.png', height: 30,),

                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5.0,
                          offset: Offset(0, 5)),
                      BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                    ]
                ),
              ),
              _value == 4 ? MyInputField(title: 'Card Number', hint: "Card Number",) : Container(),
              _value == 4 ?Row(
                children: [
                  Expanded(child: MyInputField(title: 'Expiry Date', hint: "MM/YY",)),
                  SizedBox(width: 10,),
                  Expanded(child: MyInputField(title: 'CW/CVC', hint: "123",)),
                ],
              ) : Container()
            ],
          ),
        ),
      ),

      bottomNavigationBar: Container(
        height: height * 0.1,
        padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: MyButton(
          label: "Complete Order - Tk 130000",
          onTap: (){

          },
        ),
      ),
    );
  }
}
