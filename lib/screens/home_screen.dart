import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/food_list.dart';
import 'package:flutter_food_app/model/food_model.dart';
import 'package:flutter_food_app/view_model/food_view_model.dart';
import 'package:flutter_food_app/view_model/netwok_response.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  NetworkResponse networkResponse = NetworkResponse();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Food List'),
            backgroundColor: Colors.blueGrey,
          ),
          body: Consumer<FoodViewModel>(
            builder: (context, foodViewModel, child) {
              return FutureBuilder<FoodList>(
                future: networkResponse.getFoodList(),
                builder: (context, data) {
                  if (data.hasData) {
                    FoodList list = data.data as FoodList;
                    print('MakeupList:' + list.toString());
                    return ListView.builder(
                      itemCount: list.foodList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Food item = list.foodList[index];
                        return Card(
                          color: Colors.white54,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.foodName,style: const TextStyle(
                                  color: Colors.black,fontSize: 15,
                                  fontWeight: FontWeight.w600
                              ),),
                              Text(item.flag ,style: const TextStyle(
                                  color: Colors.black,fontSize: 15,
                                  fontWeight: FontWeight.w300
                              ),),
                              Text(item.image,style: const TextStyle(
                                color: Colors.blue,fontSize: 15,fontWeight: FontWeight.w300
                              ),)
                            ],
                          ),


                        );
                      },
                    );
                  } else if (data.hasError) {
                    throw Exception(
                        'Failed to load:' + data.error.toString());
                  }
                  return Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
