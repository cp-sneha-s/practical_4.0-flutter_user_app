import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food_app/model/food_model.dart';
import 'package:flutter_food_app/view_model/user_database.dart';
import 'package:flutter_food_app/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import 'user_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<User>> futureList;

  @override
  void initState() {
    super.initState();
    UserViewModel userViewModel = UserViewModel();
    futureList = userViewModel.refreshDataFromApi() as Future<List<User>>;
  }

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
                future: futureList,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemCount: userViewModel.userList!.length,
                      itemBuilder: (BuildContext context, int index) {
                        if (userViewModel.userList == null) {
                          return const Text(
                              'Please check your Network connection');
                        } else {
                          User user = userViewModel.userList![index];
                          return UserCard(
                              item: user,
                              longpressCallback: () {
                                userViewModel.deleteUser(user);
                              });
                        }
                      },
                    );
                  } else {
                    if (snapshot.connectionState == ConnectionState.done) {
                      List<User>? list = snapshot.data as List<User>;
                      return RefreshIndicator(
                        onRefresh: () {
                          futureList = userViewModel.refreshDataFromApi();
                          return futureList;
                        },
                        child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (context, index) {
                              User user = list[index];
                              return UserCard(
                                  item: user,
                                  longpressCallback: () {
                                    setState(() {
                                      list.remove(user);
                                      userViewModel.deleteUserfronDb(user);
                                    });
                                  });
                            }),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }
                });
          }),
        ),
      ),
    );
  }
}
