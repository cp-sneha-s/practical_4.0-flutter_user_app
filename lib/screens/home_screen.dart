import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/food_list.dart';
import 'package:flutter_food_app/model/food_model.dart';
import 'package:flutter_food_app/view_model/food_view_model.dart';
import 'package:flutter_food_app/view_model/netwok_response.dart';
import 'package:provider/provider.dart';

import 'food_card.dart';

class HomeScreen extends StatelessWidget {

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Hello Foodies'),
            backgroundColor: Colors.blueGrey,
          ),
          body: Consumer<FoodViewModel>(
            builder: (context, foodViewModel, child) {
              return FutureBuilder<FoodList>(
                future: foodViewModel.getFoodListFromNetworkResponse(),
                builder: (context, data) {
                  print('homeScreen: list found ' + data.data.toString());
                  if (data.hasData) {
                    FoodList? list = data.data as FoodList;
                    return ListView.builder(
                      itemCount: list.foodList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Food? item = list.foodList[index];
                        return FoodCard(item: item);
                      },
                    );
                  } else if (data.hasError) {
                    throw Exception('Failed to load:' + data.error.toString());
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
