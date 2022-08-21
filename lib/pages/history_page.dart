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
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Column(
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
