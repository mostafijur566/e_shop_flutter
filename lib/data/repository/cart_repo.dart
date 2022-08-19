import 'package:e_shop_flutter/data/api/api_client.dart';
import 'package:e_shop_flutter/models/cart_model.dart';
import 'package:e_shop_flutter/utils/app_constants.dart';
import 'package:get/get.dart';

class CartRepo extends GetxService{
  final ApiClient apiClient;
  CartRepo({required this.apiClient});
  
  Future<Response> uploadCartItems(CartModel cartModel) async{
    return await apiClient.postData(AppConstants.CART_ENDPOINT, cartModel.toJson());
  }
}