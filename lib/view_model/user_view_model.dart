import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/food_model.dart';
import 'package:flutter_food_app/view_model/user_database.dart';
import 'package:flutter_food_app/view_model/network_response_provider.dart';

class UserViewModel extends ChangeNotifier {
  List<User>? userList = [];

  final NetworkResponseProvider _networkResponse = NetworkResponseProvider();

  UserViewModel() {
    getUserListFromDatabase().then((value) => value = userList!);
  }

  Future<List<User>> refreshDataFromApi() async {
    List<User> userList = await _networkResponse.getUserList();
    for (int i = 0; i < userList.length; i++) {
      User user = userList[i];
      UserDatabase.db.delelteAll();
      UserDatabase.db.insertUser(user);
      print('UserViewModel: data added to database ');
    }
    print('UserViewModel: ' + userList.length.toString());
    notifyListeners();
    return userList;
  }

  Future<List<User>?> getUserListFromDatabase() async {
    userList = await UserDatabase.db.getUserList();
    return userList;
  }

  Future<void> deleteUserfronDb(User user) async {
    await UserDatabase.db.deleteUser(user);
    print('user deleted from list');
  }

  void deleteUser(User user) {
    deleteUserfronDb(user);
    userList!.remove(user);
    notifyListeners();
  }
}
