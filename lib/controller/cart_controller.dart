import 'package:e_shop_flutter/data/repository/cart_repo.dart';
import 'package:e_shop_flutter/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/response_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;
  CartController({required this.cartRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

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
      responseModel = ResponseModel(false, response.statusText!);
      Get.snackbar('Error!', response.body["message"].toString(),
          colorText: Colors.white,
          backgroundColor: Colors.redAccent);
    }
    _isLoading=false;
    update();
    return responseModel;
  }
}