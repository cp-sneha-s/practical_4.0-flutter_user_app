import 'package:flutter/material.dart';
import 'package:flutter_food_app/screens/home_screen.dart';
import 'package:flutter_food_app/view_model/food_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (BuildContext context) {
        return FoodViewModel();
      },
      child: HomeScreen()));
}
