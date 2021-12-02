import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class NetworkResponse{
    Future<List<dynamic>> getFoodList()async{
      http.Response getData = await http.get(Uri.parse(
          ' https://yummly2.p.rapidapi.com/feeds/list'),
           headers: 'x-rapidapi-host': 'yummly2.p.rapidapi.com',
                   'x-rapidapi-key': '826155c0damshb4218ffbcf2554dp1a2017jsn8965ebf45cfb'

      );

      
    }
}