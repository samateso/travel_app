import 'package:flutter/cupertino.dart';

class Users {
  final int id;
  final String name;
  final AssetImage image;


  Users(this.id, this.name, this.image);

  /*factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }*/
}