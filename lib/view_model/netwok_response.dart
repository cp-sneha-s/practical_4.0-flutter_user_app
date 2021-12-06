import 'dart:convert';
import 'package:flutter_food_app/model/food_list.dart';
import 'package:flutter_food_app/model/food_model.dart';
import 'package:http/http.dart' as http;

class NetworkResponse {
  Future<FoodList> getFoodList() async {
    http.Response response = await http
        .get(Uri.parse('https://yummly2.p.rapidapi.com/feeds/list'), headers: {
      'content-type': 'application/json',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      'x-rapidapi-key': '826155c0damshb4218ffbcf2554dp1a2017jsn8965ebf45cfb'
    });
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print(response.statusCode.toString());

      FoodList list = FoodList.fromJson(data);
      for (int i = 0; i < list.foodList.length; i++) {
        Food food = list.foodList[i];
        print(food.foodName);
        print(food.flag);
        print(food.image);
      }
      return list;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
