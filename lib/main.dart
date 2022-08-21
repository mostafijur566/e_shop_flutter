import 'package:e_shop_flutter/controller/product_list_controller.dart';
import 'package:e_shop_flutter/pages/account_page.dart';
import 'package:e_shop_flutter/pages/auth/sign_in_page.dart';
import 'package:e_shop_flutter/pages/auth/sign_up_page.dart';
import 'package:e_shop_flutter/pages/auth/sign_up_user_details_page.dart';
import 'package:e_shop_flutter/pages/cart_page.dart';
import 'package:e_shop_flutter/pages/history_page.dart';
import 'package:e_shop_flutter/pages/home_page.dart';
import 'package:e_shop_flutter/pages/nav_bar.dart';
import 'package:e_shop_flutter/pages/payment_page.dart';
import 'package:e_shop_flutter/pages/product_details_page.dart';
import 'package:e_shop_flutter/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/auth_controller.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Get.find<AuthController>().userLoggedIn();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Shop',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HistoryPage()
    );
  }
}
