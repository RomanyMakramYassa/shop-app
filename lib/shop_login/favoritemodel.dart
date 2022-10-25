class ChangeFavoriteModel {
  late bool State;
  late String message;
  ChangeFavoriteModel.fromjson(Map<String, dynamic> json) {
    State = json['status'];
    message = json['message'];
  }
}
