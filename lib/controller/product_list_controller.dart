import 'package:e_shop_flutter/data/repository/product_list_repo.dart';
import 'package:get/get.dart';

import '../models/product_list_model.dart';

class ProductListController extends GetxController{
  final ProductListRepo productRepo;
  ProductListController({required this.productRepo});

  List<Products> _allProductList = [];
  List<Products> get allProductList => _allProductList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> getProduct() async{
    Response response = await productRepo.getProduct();

    if(response.statusCode == 200){
      _allProductList = [];
      _allProductList.addAll(Product.fromJson(response.body).products);
      _isLoading = true;
      print('product got');
      update();
    }
    else{
      print(response.body);
    }
  }
}