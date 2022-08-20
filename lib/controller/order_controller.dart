import 'package:e_shop_flutter/data/repository/order_repo.dart';
import 'package:e_shop_flutter/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cart_get_items_model.dart';
import '../models/response_model.dart';

class OrderController extends GetxController{
  final OrderRepo orderRepo;
  OrderController({required this.orderRepo});

  List<dynamic> _allCartItems = [];
  List<dynamic> get allCartItems => _allCartItems;

  List<int> _orderId = [];
  List<int> get orderId => _orderId;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? cartItem;
  int totalAmount = 0;

  Future<ResponseModel> uploadCartItems(CartModel cartModel) async{
    _isLoading = true;
    update();

    Response response = await orderRepo.uploadCartItems(cartModel);
    late ResponseModel responseModel;

    if(response.statusCode == 200){
      responseModel = ResponseModel(true, response.body["message"]);

    }
    else{
      print(response.body);
      responseModel = ResponseModel(false, response.statusText!);
      Get.snackbar('Error!', response.body["message"].toString(),
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
    _isLoading=false;
    update();
    return responseModel;
  }


  Future<void> getCartItems() async{
    Response response = await orderRepo.getCartItems();

    if(response.statusCode == 200){
      _allCartItems = [];
      _orderId = [];
      totalAmount = 0;
      _allCartItems.addAll(Cart.fromJson(response.body).allOrders);
      cartItem = Cart.fromJson(response.body).totalOrder.toString();

      for(int i = 0; i < _allCartItems.length; i++){
        totalAmount = totalAmount + int.parse(_allCartItems[i].totalPrice.toString());
        _orderId.add(int.parse(_allCartItems[i].id.toString()));
      }

      _isLoading = true;
      update();
    }

    else{
      Get.snackbar('Error!', 'Please check your internet connection!',
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }
  }
}