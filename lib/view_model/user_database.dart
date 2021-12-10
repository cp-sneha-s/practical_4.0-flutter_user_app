import 'dart:async';
import 'package:flutter_food_app/model/food_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserDatabase {
  static final UserDatabase db = UserDatabase._init();

  UserDatabase._init();


 Future<Database> initDb() async {
    return  openDatabase(join(await getDatabasesPath(), 'user.db'),
        version: 1, onCreate: (Database db, int version) async {
      print('user table created');
      await db.execute('CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'name TEXT,'
          ' email TEXT, '
          'city TEXT)');
    });
  }

  Future<List<User>> getUserList() async {
    final db = await initDb();

    List<Map<String, dynamic>> data = await db.rawQuery('SELECT * FROM user');
    List<User> userList = [];
    data.forEach((element) {
      User user = User.fromMap(element);
      userList.add(user);
      print('Database: ' + userList.length.toString());
    });
    return userList;
  }

  Future<int> deleteUser(User user) async {
    final db = await initDb();
    return await db
        .delete('user', where: "name = ?", whereArgs: [user.name]);
  }

 Future<void> insertUser(User user) async {
    final db = await initDb();
     db.insert('user', user.toMap());
  }

  delelteAll()async{
   final db = await initDb();
   db.rawDelete('Delete from user');
   print('all data deleted!');
  }


}
