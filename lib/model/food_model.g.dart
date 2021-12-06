// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Food _$FoodFromJson(Map<String, dynamic> json) => Food(
      foodName: json['display']['displayName'] as String,
      flag: json['display']['flag'],
      image: json['display']['images'][0],

    );

Map<String, dynamic> _$FoodToJson(Food instance) => <String, dynamic>{
      'foodName': instance.foodName,
    };
