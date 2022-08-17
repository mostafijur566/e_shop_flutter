import 'package:e_shop_flutter/data/repository/product_details_repo.dart';
import 'package:get/get.dart';

import '../models/product_details_model.dart';

class ProductDetailsController extends GetxController{
  final ProductDetailsRepo productDetailsRepo;
  ProductDetailsController({required this.productDetailsRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? name;
  int? price;
  String? description;
  String? image;
  bool? stock;

  Future<void> getProduct(String id) async{
    Response response = await productDetailsRepo.getProduct(id);
    if(response.statusCode == 200){
      name = ProductDetails.fromJson(response.body).name;
      price = ProductDetails.fromJson(response.body).price;
      description = ProductDetails.fromJson(response.body).descriptions;
      image = ProductDetails.fromJson(response.body).image;
      stock = ProductDetails.fromJson(response.body).stock;
      _isLoading = true;
      update();
    }

    else{
      print(response.statusCode);
    }
  }
}