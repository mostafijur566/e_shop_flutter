import 'package:e_shop_flutter/utils/app_constants.dart';
import 'package:get/get.dart';

import '../api/api_client.dart';

class UserInfoRepo extends GetxService{
  final ApiClient apiClient;
  UserInfoRepo({required this.apiClient});

  Future<Response> getUserInfo() async{
    return await apiClient.getData(AppConstants.USER_INFO_ENDPOINT);
  }
}