import 'dart:convert';
import 'dart:io';


import'package:flutter/material.dart';
import 'package:hackthoneventproject/api/api_helpers.dart';
import 'package:hackthoneventproject/api/api_settings.dart';
import 'package:hackthoneventproject/models/base_api_object_response.dart';
import 'package:hackthoneventproject/models/user.dart';
import 'package:hackthoneventproject/prefs/shared_pref_controller.dart';
import 'package:http/http.dart' as http;

class AuthApiController with ApiHelpers{


  Future <bool> login (BuildContext context,{required String mobile,required String password}) async {
    var url = Uri.parse(ApiSettings.login);
    var response = await http.post(url, body: {
      'mobile': mobile,
      'password': password,
    },
    headers: headers
    );

    print(response.statusCode);
    if (response.statusCode == 200)  {
      User user = User.fromJson(jsonDecode(response.body)['data']);
       await SharedPrefController().save(user: user);
      showSnackBar(context: context, message: jsonDecode(response.body)['message']);

      return true;

    }
    else if(response.statusCode==400){
      showSnackBar(context: context,
          message: jsonDecode(response.body)['message'],
          error: true);

    }
else{
      showSnackBar(context: context,
          message: 'Something went wrong ,please try again',
          error: true);
    }
return false;
    }


  Future <bool> logout() async {
    var url = Uri.parse(ApiSettings.logout);
    var response = await http.get(url,headers: headers);
    if (response.statusCode == 200 || response.statusCode == 401) {
      //SharedPrefController().clear();
      return true;
    }
    return false;

  }

}