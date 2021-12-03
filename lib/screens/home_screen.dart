import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/food_model.dart';
import 'package:flutter_food_app/view_model/netwok_response.dart';

class HomeScreen extends StatelessWidget {
  NetworkResponse networkResponse = NetworkResponse();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Food List'),
            backgroundColor: Colors.teal,
          ),
          body: Container(
            child: FutureBuilder(
              future: networkResponse.getFoodList(),
              builder: (context,data){
                if(data.hasData){
                  Object? food = data.data;
                  return  Text(food.toString());
                }else if(data.hasError){
                 return Text(data.error.toString());
                }return CircularProgressIndicator();

              },
            ),
          ),

        ),

      ),
    );
  }
}
