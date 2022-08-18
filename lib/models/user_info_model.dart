class UserInfoModel {
  String? user;
  String? name;
  String? billingAddress;
  String? shippingAddress;
  String? phone;

  UserInfoModel({
    required this.user,
    required this.name,
    required this.billingAddress,
    required this.shippingAddress,
    required this.phone,
  });

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["user"] = user;
    data["name"] = name;
    data["billing_address"] = billingAddress;
    data["shipping_address"] = shippingAddress;
    data['phone'] = phone;
    return data;
  }
}
