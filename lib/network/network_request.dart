import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:github_api_app/constants/app_string.dart';
import 'package:github_api_app/model/user_detail.dart';
import 'package:github_api_app/model/users.dart';
import 'package:http/http.dart' as http;

// class consist function to fetch json from API and parse it to models 
class NetworkRequest {

//User List

  // request json list user from url=> parse it to List<User> with pasreUsers function and return List<User>
  static Future<List<Users>> fetchUsers(String urlToGetUsers) async{
    
    final response = await http.get(Uri.parse(urlToGetUsers));
    if(response.statusCode==200){
      return compute(parseUsers,response.body);
    }
    else if (response.statusCode==404){
      throw Exception("Not Found");
    }
    else throw Exception("Can't get list of user");
  }

  // parse json to List<User>
  static List<Users> parseUsers(String responseBody){
    var list = jsonDecode(responseBody) as List<dynamic>;
    List<Users> users = list.map((model) => Users.fromJson(model)).toList();
    return users;
  }

//=====================

// User Detail

  // Request json UserDetail from url which pass from UserList screen => parse it to UserDetail model and return UserDetail
  static Future<UserDetail> fetchUserDetail(String urlDetail) async{
    final response_detail = await http.get(Uri.parse(urlDetail));
    if(response_detail.statusCode==200){
      print("fetch success $urlDetail at:\n ${DateTime.now().millisecondsSinceEpoch}" );
      // print(response_detail.body);
      return compute(parseUserDetail,response_detail.body);
    }
    else if (response_detail.statusCode==404){
      throw Exception("Not Found");
    }
    else throw Exception("Can't get detail of user");
  }

  // Parse json to User Detail model
  static UserDetail parseUserDetail(String responseBody){
    var detail = jsonDecode(responseBody) as dynamic;
    UserDetail usersDetail = UserDetail.fromJson(detail);
    print("parse json( type text) to model class at: \n ${DateTime.now().millisecondsSinceEpoch}" );
    print("---------------");
    return usersDetail;
  }


}

