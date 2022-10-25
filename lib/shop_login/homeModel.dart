class HomeModel {
  bool? states;
  HomeDataModel? data;
  HomeModel.fromjson(Map<String, dynamic> json) {
    states = json['states'];
    data = HomeDataModel.fromjson(json['data']);
  }
}

class HomeDataModel {
  List<BannersModel> banerslist = [];
  List<product> productlist = [];
  HomeDataModel.fromjson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banerslist.add(BannersModel.fromjson(element));
    });
    json['products'].forEach((element) {
      productlist.add(product.fromjson(element));
    });
  }
}

class BannersModel {
  int? id;
  String? image;
  BannersModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

// ignore: camel_case_types
class product {
  int? id;
  dynamic price;
  // ignore: non_constant_identifier_names, unnecessary_question_mark
  dynamic old_price;
  dynamic discount;
  String? image;
  String? name;
  bool? favorite;
  bool? incart;

  product.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    old_price = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    favorite = json['in_favorite'];
    incart = json['in_cart'];
  }
}
