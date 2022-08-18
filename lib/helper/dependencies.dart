import 'package:e_shop_flutter/controller/auth_controller.dart';
import 'package:e_shop_flutter/controller/product_details_controller.dart';
import 'package:e_shop_flutter/controller/product_list_controller.dart';
import 'package:e_shop_flutter/data/api/api_client.dart';
import 'package:e_shop_flutter/data/repository/auth_repo.dart';
import 'package:e_shop_flutter/data/repository/product_details_repo.dart';
import 'package:e_shop_flutter/data/repository/product_list_repo.dart';
import 'package:e_shop_flutter/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

Future<void> init() async{
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);

  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => ProductListRepo(apiClient: Get.find()));
  Get.lazyPut(() => ProductDetailsRepo(apiClient: Get.find()));

  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => ProductListController(productRepo: Get.find()));
  Get.lazyPut(() => ProductDetailsController(productDetailsRepo: Get.find()), fenix: true);
}