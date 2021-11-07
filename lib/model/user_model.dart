import 'dart:convert';


UserModel userModelFromJson(String str) => UserModel.convertFromJsonToUserModel(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.convertUserModelToJson());
class UserModel {
  ///For the API response, we should create a model that have the same properties
  /// as the properties of API response body in this class:
  String? id;
  String? name;
  String? job;
  DateTime? createdAt;

  UserModel({this.id, this.name, this.job, this.createdAt});

  factory UserModel.convertFromJsonToUserModel(Map<String, dynamic> json) => UserModel(
      name: json["name"],
      job:  json["job"],
      id: json["id"],
      createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> convertUserModelToJson() => {
    "name": name,
    "job": job,
    "id": id,
    "createdAt": createdAt,
  };
}