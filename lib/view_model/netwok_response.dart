import 'dart:convert';


import 'package:flutter_food_app/model/food_model.dart';
import 'package:http/http.dart' as http;



class NetworkResponse{
    Future<dynamic> getFoodList()async{
      http.Response response = await http.get(Uri.parse(
          'https://yummly2.p.rapidapi.com/feeds/list'),
           headers: { 'content-type': 'application/json',
                   'x-rapidapi-host': 'yummly2.p.rapidapi.com',
                   'x-rapidapi-key': '826155c0damshb4218ffbcf2554dp1a2017jsn8965ebf45cfb'}
                   );
      if(response.statusCode ==200){
        dynamic data = jsonDecode(response.body);
          print(data.toString());
          print(response.statusCode.toString());
        dynamic food = Food.fromJson(data);
        print('food' + food.toString());
        return food;

      }else {
       throw Exception(response.statusCode.toString());
      }
    }
}