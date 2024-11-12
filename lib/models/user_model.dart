import 'package:pos_app/constants.dart';

class UserModel {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? contactNumber;
  DateTime? createdAt;
  DateTime? updatedAt;

  UserModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.contactNumber,
    this.createdAt,
    this.updatedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json[Constants.id];
    firstName = json[Constants.firstName];
    lastName = json[Constants.lastName];
    email = json[Constants.email];
    contactNumber = json[Constants.contactNumber];
    createdAt = DateTime.parse(json[Constants.createdAt]);
    updatedAt = DateTime.parse(json[Constants.updatedAt]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data[Constants.id] = id;
    data[Constants.firstName] = firstName;
    data[Constants.lastName] = lastName;
    data[Constants.email] = email;
    data[Constants.contactNumber] = contactNumber;
    data[Constants.createdAt] = createdAt!.toIso8601String();
    data[Constants.updatedAt] = updatedAt!.toIso8601String();
    return data;
  }
}
