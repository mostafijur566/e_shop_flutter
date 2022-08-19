import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../data/repository/auth_repo.dart';
import '../models/response_model.dart';
import '../models/signin_body.dart';
import '../models/signup_body.dart';
import 'package:http/http.dart' as http;

import '../utils/app_constants.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;

  AuthController({required this.authRepo});

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<ResponseModel> registration(SignUpBody signUpBody) async{
    _isLoading = true;
    update();
    Response response = await authRepo.registration(signUpBody);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      if(response.body["status"] == 400){
        responseModel = ResponseModel(false, response.body["message"]);
        Get.snackbar('Error!', response.body["message"].toString(),
            colorText: Colors.white,
            backgroundColor: Colors.redAccent);
      }
      else{
        authRepo.saveUserToken(response.body["token"]);
        responseModel = ResponseModel(true, response.body["message"]);
      }
    }
    else{
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading=false;
    update();
    return responseModel;
  }

  Future<ResponseModel> login(SignInBody signInBody) async{
    _isLoading = true;
    update();
    Response response = await authRepo.login(signInBody);
    late ResponseModel responseModel;
    if(response.statusCode == 200){
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, "success");
    }
    else{
      responseModel = ResponseModel(false, "Unable to log in with provided credentials.");
      Get.snackbar('Error!', "Unable to log in with provided credentials.",
          colorText: Colors.white,
          backgroundColor: Colors.redAccent
      );
    }
    _isLoading=false;
    update();
    return responseModel;
  }

  Future <void> loggedInUser() async{
    String token;
    token = await authRepo.getUserToken();
    authRepo.saveUserToken(token);
  }

  void saveEmailAndPassword(String email, String password){
    authRepo.saveEmailAndPassowrd(email, password);
  }

  bool userLoggedIn(){
    return authRepo.userLoggedIn();
  }

  Future<void> clearToken() async{
    await authRepo.clearToken();
  }

  PickedFile? _pickedFile;
  PickedFile? get pickedFile => _pickedFile;

  final _picker = ImagePicker();

  Future<void> pickedImage() async{
    _pickedFile = await _picker.getImage(source: ImageSource.gallery);
    update();
  }

  Future<ResponseModel> uploadUserData(String user, String name, String billingAddress, String shippingAddress, String phone) async{
    update();

    http.StreamedResponse response = await updateProfile(_pickedFile, user, name, billingAddress, shippingAddress, phone);

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

  Future<http.StreamedResponse> updateProfile(PickedFile? data, String user, String name, String billingAddress, String shippingAddress, String phone) async{
    http.MultipartRequest request = http.MultipartRequest('POST', Uri.parse('http://e-shop-system.herokuapp.com/api/v1/customer/details/'), );
    if(GetPlatform.isMobile && data != null) {
      File _file = File(data.path);
      request.files.add(http.MultipartFile('image', _file.readAsBytes().asStream(), _file.lengthSync(), filename: _file.path.split('/').last));
    }
    Map<String, String> _fields = Map();
    _fields.addAll(<String, String>{
      'user': user,
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