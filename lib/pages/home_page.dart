import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/big_text.dart';
import '../widgets/custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                          text: 'Hello,',
                          textColor: AppColors.titleColor,
                          fontSize: 16),
                      CustomText(
                        text: 'Mostafijur Rahman',
                        textColor: AppColors.mainBlackColor,
                        fontSize: 18,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/images/profile.jpg'),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: double.maxFinite,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Search...',
                      style: TextStyle(color: AppColors.paraColor),
                    ),
                    Icon(
                      Icons.search,
                      color: AppColors.mainColor,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)
                ),
              ),
              SizedBox(height: 20,),
              BigText(text: 'Featured Products',),
              SizedBox(height: 20,),
              Expanded(
                child: SingleChildScrollView(
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          mainAxisExtent: 250
                      ),
                      itemCount: 7,
                      itemBuilder: (context, index){
                        return Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  width: 150,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.green,
                                      image: DecorationImage(
                                          image: AssetImage('assets/images/macbook.jpg',),
                                          fit: BoxFit.cover
                                      )
                                  ),
                                ),
                              ),

                              SizedBox(height: 30,),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8, right: 8),
                                  child: BigText(
                                    text: 'Macbook', size: 16, color: AppColors.paraColor,),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0, left: 8),
                                child: BigText(text: '\$12'),
                              ),
                              SizedBox(height: 10,),
                              Center(
                                child: Container(
                                  //width: MediaQuery.of(context).size.width * 0.38,
                                  padding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(CupertinoIcons.cart, size: 24, color: Colors.white,),
                                    SizedBox(width: 5,),
                                    CustomText(
                                      text: 'Add to Cart', textColor: Colors.white, fontSize: 16,
                                    ),
                                  ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: AppColors.mainColor
                                  ),
                                ),
                              ),
                            ],
                          ),

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xFFe8e8e8),
                                    blurRadius: 5.0,
                                    offset: Offset(0, 5)),
                                BoxShadow(color: Colors.white, offset: Offset(-5, 0)),
                              ]
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}