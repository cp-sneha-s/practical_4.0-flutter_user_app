import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/food_list.dart';
import 'package:flutter_food_app/model/food_model.dart';
import 'package:flutter_food_app/view_model/food_database.dart';
import 'package:flutter_food_app/view_model/netwok_response.dart';

class FoodViewModel extends ChangeNotifier {
  late List<Food> listOfFood;
  late Future<FoodList> _foodList;

  final NetworkResponse _networkResponse = NetworkResponse();

  Future<FoodList> getFoodListFromNetworkResponse()async{
    _foodList= _networkResponse.getFoodList();
    notifyListeners();
    return _foodList;

  }

  Future<List<Food>> storeToDatabase() async {
    listOfFood = await getFoodListFromNetworkResponse().then((value) => value.foodList);
    notifyListeners();
    for (int i = 0; i < listOfFood.length; i++) {
      Food food = listOfFood[i];
      FoodDatabase.db.insertFood(food);
      notifyListeners();
      print('foodViewModel: data added to database ');
    }
    print('foodViewModel: ' + listOfFood.length.toString());
    notifyListeners();
    return listOfFood;
  }

  Future<List<Food>> getFoodListFromDatabase() async {
  await FoodDatabase.db.getFoodList().then((value) => listOfFood =value  );
    notifyListeners();
    return listOfFood;
  }
}
