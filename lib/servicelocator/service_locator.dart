import 'package:flutter_food_app/view_model/network_response_provider.dart';
import 'package:flutter_food_app/view_model/user_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt getIt= GetIt.instance;

void setUpLocator(){
      getIt.registerLazySingleton(() => UserViewModel());
      getIt.registerLazySingleton(() => NetworkResponseProvider());
 }