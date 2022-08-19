import 'dart:convert';
import 'dart:io';
import 'package:e_shop_flutter/data/repository/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../data/repository/user_info_repo.dart';
import '../models/response_model.dart';
import '../models/user_info_model.dart';
import 'package:http/http.dart' as http;

class UserInfoController extends GetxController{
  final UserInfoRepo userInfoRepo;
  UserInfoController({required this.userInfoRepo});

  String? image;
  String? user;
  String? name;
  String? billingAddress;
  String? shippingAddress;
  String? phone;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _upload = false;
  bool get upload => _upload;

  PickedFile? _pickedFile;
  PickedFile? get pickedFile => _pickedFile;

  final _picker = ImagePicker();

  Future<void> pickedImage() async{
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    update();
  }

  Future<void> getUserInfo() async{
    Response response = await userInfoRepo.getUserInfo();

    if(response.statusCode == 200){
      image = UserInfoModel.fromJson(response.body).image;
      user = UserInfoModel.fromJson(response.body).user;
      name = UserInfoModel.fromJson(response.body).name;
      billingAddress = UserInfoModel.fromJson(response.body).billingAddress;
      shippingAddress = UserInfoModel.fromJson(response.body).shippingAddress;
      phone = UserInfoModel.fromJson(response.body).phone;

      _isLoading = true;
      update();
    }

    else{
      Get.snackbar('Error!', 'Something went wrong!',
          icon: Icon(Icons.warning, color: Colors.white,),
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }
  }
  Future<ResponseModel> uploadUserData(String name, String billingAddress, String shippingAddress, String phone) async{
    _upload = true;
    update();
    http.StreamedResponse response = await updateProfile(_pickedFile, name, billingAddress, shippingAddress, phone);

    late ResponseModel responseModel;

    if(response.statusCode == 200){
      Map map = jsonDecode(await response.stream.bytesToString());
      String message = map['message'];
      responseModel = ResponseModel(true, message);
      Get.snackbar('Success!', message,
          icon: Icon(Icons.check_box, color: Colors.white,),
          colorText: Colors.white,
          backgroundColor: Colors.green
      );

      _upload = false;
      update();
    }

    else{
      responseModel = ResponseModel(false, "Something went wrong");
      Get.snackbar('Error!', "Something went wrong!",
          icon: Icon(Icons.warning_amber_rounded, color: Colors.white,),
          colorText: Colors.white,
          backgroundColor: Colors.red
      );
    }

    return responseModel;
  }

  Future<http.StreamedResponse> updateProfile(PickedFile? data, String name, String billingAddress, String shippingAddress, String phone) async{

    AuthRepo authRepo = await AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find());

    String token;

    authRepo.getUserToken();
    token = authRepo.authToken.toString();

    http.MultipartRequest request = http.MultipartRequest('PUT', Uri.parse('http://e-shop-system.herokuapp.com/api/v1/customer/details/'), );
    request.headers.addAll(<String,String>{'Authorization': 'Token $token'});
    if(GetPlatform.isMobile && data != null) {
      File _file = File(data.path);
      request.files.add(http.MultipartFile('image', _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last));
    }
    Map<String, String> _fields = Map();
    _fields.addAll(<String, String>{
      'name': name,
      'billing_address': billingAddress,
      'shipping_address': shippingAddress,
      'phone': phone
    });
    request.fields.addAll(_fields);
    http.StreamedResponse response = await request.send();

    return response;
  }


}