import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/food_model.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({required this.item});

  final Food item;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white54,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.foodName??'',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              item.flag??'',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            ),
            Text(
              item.image??'',
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                  fontWeight: FontWeight.w300),
            )
          ],
        ),
      ),
    );
  }
}
