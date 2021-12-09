import 'dart:async';
import 'package:flutter_food_app/model/food_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FoodDatabase {
  static final FoodDatabase db = FoodDatabase._init();

  FoodDatabase._init();

 Future<Database> initDb() async {
    return  openDatabase(join(await getDatabasesPath(), 'food.db'),
        version: 1, onCreate: (Database db, int version) async {
      print('food table created');
      await db.execute('CREATE TABLE food(id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'foodName TEXT,'
          ' image TEXT, '
          'flag TEXT)');
    });
  }

  Future<List<Food>> getFoodList() async {
    final db = await initDb();

    List<Map<String, dynamic>> data = await db.query('food');
    List<Food> foodList = [];
    data.forEach((element) {
      Food food = Food.fromJson(element);
      foodList.add(food);
      print('Database: ' + foodList.toString());
    });
    return foodList;
  }

  Future<int> deleteFood(Food food) async {
    final db = await initDb();
    return await db
        .delete('food', where: "displayName = ?", whereArgs: [food.foodName]);
  }

  insertFood(Food food) async {
    final db = await initDb();
    final newfood = db.insert('food', food.toMap());
    return newfood;
  }
}
