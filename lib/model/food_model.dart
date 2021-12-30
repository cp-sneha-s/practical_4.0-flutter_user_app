
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';



@JsonSerializable()
class User{
  final String name;
  final String email;
  final String city;

  User({ required this.name, required this.email, required this.city});

  factory User.fromJson(Map<String,dynamic> json)=> _$UserFromJson(json);

  factory User.fromMap(Map<String,dynamic> map) {
    return User(name: map['name'],
        email: map['email'],
        city: map['city']);
  }

  Map<String,dynamic> toMap() => _$UserToJson(this);

}