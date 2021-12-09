import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/food_model.dart';
import 'package:flutter_food_app/view_model/user_database.dart';
import 'package:flutter_food_app/view_model/user_view_model.dart';
import 'package:flutter_food_app/view_model/netwok_response.dart';
import 'package:provider/provider.dart';
import 'user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  NetworkResponse networkResponse = NetworkResponse();
  late Future<List<User>> futureList;
  //
  // @override
  // void didChangeDependencies() {
  //   super.didChangeDependencies();
  //  futureList = Provider.of<UserViewModel>(context).getUserListFromNetworkResponse();
  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Hello Users'),
            backgroundColor: Colors.blueGrey,
          ),
          body:
              Consumer<UserViewModel>(builder: (context, userViewModel, child) {
                return FutureBuilder(
              future:userViewModel.getUserListFromDatabase(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  List<User> list = snapshot.data as List<User>;
                  print(list.length.toString());
                  return  ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (BuildContext context, int index) {
                      User item = list[index];
                      return FoodCard(item: item);
                    },
                  );
                }else if(snapshot.hasError){
                  throw Exception('Failed to load: '+ snapshot.error.toString());
                }
                return const Center(child: CircularProgressIndicator());
              },
            );
          }),
        ),
      ),
    );
  }
}
