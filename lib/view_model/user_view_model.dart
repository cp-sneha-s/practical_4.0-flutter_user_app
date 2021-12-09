import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/food_model.dart';
import 'package:flutter_food_app/view_model/user_database.dart';
import 'package:flutter_food_app/view_model/netwok_response.dart';

class UserViewModel extends ChangeNotifier {
   List<User> userList = [];


  final NetworkResponse _networkResponse = NetworkResponse();

  Future<List<User>> getUserListFromNetworkResponse()async{
  Future<List<User>>  futureUserList= _networkResponse.getUserList();
    notifyListeners();
    return futureUserList;

  }

  Future<List<User>> storeToDatabase() async {
    userList = await getUserListFromNetworkResponse().then((value) => value);
    for (int i = 0; i < userList.length; i++) {
      User user = userList[i];
      UserDatabase.db.insertUser(user);
      notifyListeners();
      print('UserViewModel: data added to database ');
    }
    print('UserViewModel: ' + userList.length.toString());
    notifyListeners();
    return userList;
  }

  Future<List<User>> getUserListFromDatabase() async {
   await UserDatabase.db.getUserList().then((value) => value= userList);
   return userList;
  }
}

