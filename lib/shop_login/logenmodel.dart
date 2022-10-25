class ShoploginModel {
  bool? status;
  String? massege;
  UserModel? data;
  // ShoploginModel({required this.status,required this.massege,required this.data})
  ShoploginModel.formJson(Map<String, dynamic> json) {
    status = json['status'];
    massege = json['message'];
    data = (json['data'] != null ? UserModel.formJson(json['data']) : null)!;
  }
}

class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  int? point;
  int? credit;
  String? token;

  UserModel.formJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    point = json['point'];
    credit = json['credit'];
    token = json['token'];
  }
}
