import 'package:flutter/cupertino.dart';
import 'package:flutter_food_app/model/food_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class FoodDatabase {
  
  late Database _database;

  Future openDb() async {
    _database = await openDatabase(join(await getDatabasesPath(), 'food.db'),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
          'CREAT TABLE food(id INTEGER PRIMARY KEY AUTOINCREMENT,displayName TEXT, image TEXT, flag TEXT)');
    });
    return _database;
  }
  
  Future<List<Food>> getFoodList()async{
    await openDb();
    
    List<Map<String,dynamic>> data= await _database.query('food');
    List<Food> foodList= [];
    data.forEach((element) {
      Food food = Food.fromJson(element);
      foodList.add(food);
      print('Database: '+ foodList.toString());
    });
    return foodList;
  }
  
  Future<int> deleteFood(Food food)async{
    await openDb();
    return await _database.delete('food',where: "id = ?",whereArgs: [food.id]);
    
  }

// Future<Database> initDb() async{
//  try{
//    final path = await getDatabasesPath();
//    return await openDatabase(join(path,'food.db'),version: 1,
//    onCreate:(Database db,int version) async {
//      await db.execute("CREATE TABLE Food("
//          "id INTEGER PRIMARY KEY AUTOINCREMENT,"
//          "displayName TEXT,"
//          "flag TEXT,"
//          "image TEXT,"
//      ")"
//      );
//    });
//  }
//  catch(e){
//    print('Error: $e');
//  }
// }

}
