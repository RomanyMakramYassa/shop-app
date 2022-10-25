class CatogryModel {
  late bool state;
  late Carogrydatamodel data;
  CatogryModel.fromjson(Map<String, dynamic> json) {
    state = json['status'];
    data = Carogrydatamodel.fromjson(json['data']);
  }
}

class Carogrydatamodel {
  late int curentpage;
  List<Datamodel> data = [];
  Carogrydatamodel.fromjson(Map<String, dynamic> json) {
    curentpage = json['current_page'];
    json['data'].forEach((element) {
      data.add(Datamodel.fromjson(element));
    });
  }
}

class Datamodel {
  late int id;
  late String name;
  late String image;
  Datamodel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
