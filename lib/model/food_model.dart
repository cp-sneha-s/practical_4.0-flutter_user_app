import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'food_model.g.dart';


@JsonSerializable()
class Food{
  final String foodName;
  final String flag;
  final String image;

  Food({required this.foodName,required this.flag,required this.image});

  factory Food.fromJson(Map<String,dynamic> json)=> _$FoodFromJson(json);

}