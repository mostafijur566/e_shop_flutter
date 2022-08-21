import 'package:e_shop_flutter/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widgets/big_text.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        title: Text(
          "History",
          style: TextStyle(color: AppColors.mainBlackColor),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      padding: EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 20),
                      width: double.maxFinite,
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
                      child: Row(
                        children: [
                          Image.asset('assets/images/invoice_logo.png', height: MediaQuery.of(context).size.height * 0.1,),
                          SizedBox(width: 20,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(text: "Invoice No: #001",),
                              SizedBox(height: 5,),

                              SmallText(text: "Payment Status: Bkash", size: 16,
                                color: AppColors.paraColor,
                              ),
                              SizedBox(height: 5,),
                              BigText(text: "Total Amount: 200", color: Colors.redAccent, size: 18,)
                            ],
                          )
                        ],
                      ),
                    );
                  },
              ),
            )
          ],
        ),
      ),
    );
  }
}
