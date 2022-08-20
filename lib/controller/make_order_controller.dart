import 'package:e_shop_flutter/data/repository/make_order_repo.dart';
import 'package:e_shop_flutter/models/make_order_model.dart';
import 'package:e_shop_flutter/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MakeOrderController extends GetxController{
  final MakeOrderRepo makeOrderRepo;
  MakeOrderController({required this.makeOrderRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> makeOrder(MakeOrderModel makeOrderModel) async{
    _isLoading = true;
    update();

    Response response = await makeOrderRepo.makeOrder(makeOrderModel);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      responseModel = ResponseModel(true, response.body["message"]);
      String message;
      message = response.body['message'];
      Get.snackbar(
          'Successful!', message,
          colorText: Colors.white,
          backgroundColor: Colors.green
      );
    }

    else{
      responseModel = ResponseModel(false, 'Something went wrong! Try again later');
      Get.snackbar(
          'Error!', 'Something went wrong! Try again later',
          colorText: Colors.white,
          backgroundColor: Colors.green
      );
    }
    print(response.body);
    return responseModel;
  }
}