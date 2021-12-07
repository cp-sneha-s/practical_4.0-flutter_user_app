import 'food_model.dart';

class FoodList{
   final List<Food> foodList;

  FoodList({required this.foodList});
  factory FoodList.fromJson(Map<String, dynamic> json){
    final data = json['feed'] as List<dynamic>;
    final foodlist = data.map((e) => Food.fromJson(e)).toList();
    return FoodList(
        foodList: foodlist);
  }
}


