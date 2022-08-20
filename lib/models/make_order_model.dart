class MakeOrder {
  String? user;
  List<int>? orderDetails;
  String? paymentStatus;

  MakeOrder({this.user, this.orderDetails, this.paymentStatus});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['order_details'] = this.orderDetails;
    data['payment_status'] = this.paymentStatus;
    return data;
  }
}