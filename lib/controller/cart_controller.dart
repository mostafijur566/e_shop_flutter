import 'package:e_shop_flutter/controller/product_details_controller.dart';
import 'package:e_shop_flutter/data/repository/cart_repo.dart';
import 'package:e_shop_flutter/models/cart_model.dart';
import 'package:e_shop_flutter/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/cart_get_items_model.dart';
import '../models/response_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  List<dynamic> _allCartItems = [];
  List<dynamic> get allCartItems => _allCartItems;

  List<History> _allHistory = [];
  List<History> get allHistory => _allHistory;

  List<int> _orderId = [];
  List<int> get orderId => _orderId;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? cartItem;
  int totalAmount = 0;

  Future<ResponseModel> uploadCartItems(CartModel cartModel) async{
    _isLoading = true;
    update();

    Response response = await cartRepo.uploadCartItems(cartModel);
    late ResponseModel responseModel;

    if(response.statusCode == 200){
      responseModel = ResponseModel(true, response.body["message"]);
        Get.snackbar('Added!', response.body["message"].toString(),
            colorText: Colors.white,
            backgroundColor: Colors.green
        );

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
    Response response = await cartRepo.getCartItems();

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

  Future<void> deleteOrderItems(String id) async{
    Response response = await cartRepo.deleteCartItems(id);

    if(response.statusCode == 200){
      
    }

    else{
      print('can not delete order');
    }
  }

  Future<void> getHistory() async{
    Response response = await cartRepo.getHistory();

    if(response.statusCode == 200){
      _allHistory = [];
      _allHistory.addAll(OrderHistory.fromJson(response.body).allOrder);

      _isLoading = true;
      update();
      print('Got history');
    }

    else{
      // Get.snackbar('Error!', 'Please check your internet connection!',
      //     colorText: Colors.white,
      //     backgroundColor: Colors.redAccent
      // );
      print(response.body);
    }
  }

}