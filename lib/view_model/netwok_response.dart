import 'dart:convert';
import 'package:flutter_food_app/model/food_model.dart';
import 'package:http/http.dart' as http;

class NetworkResponse {
  Future<List<User>> getUserList() async {
    http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users'), headers: {
      'content-type': 'application/json',
    });
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      print(response.statusCode.toString());
      List<User> userList = data.map((user) => User.fromJson(user)).toList();
      return userList;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
