import 'package:flutter/material.dart';
import 'package:flutter_food_app/screens/home_screen.dart';
import 'package:flutter_food_app/servicelocator/service_locator.dart';


void main() {
  setUpLocator();
  runApp(HomeScreen());
}
