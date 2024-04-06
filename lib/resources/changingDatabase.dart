

import 'dart:convert';

import 'package:electric/models/billData.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


Future<Map<String, dynamic>> createUser(String email, String houseNumber, String userType) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentJwt = prefs.getString('jwt');
    
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/users/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $currentJwt',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'houseNumber': houseNumber,
        'userType': userType,
      }),
    );
    
    Map<String, dynamic> responseData = jsonDecode(response.body);
    return responseData;
  } catch (e) {
    print("Error creating user: $e");
    throw e;
  }
}

// a function to retrieve a particular user's data based on their id
Future<Map<String, dynamic>> getUserData(String id) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentJwt = prefs.getString('jwt');
    
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/users/'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $currentJwt',
      },
      body: jsonEncode(<String, String>{
        'id': id,
      }),
    );
    
    Map<String, dynamic> responseData = jsonDecode(response.body);
    print("the response data is as follows: ");
    print(responseData);
    return responseData;
  } catch (e) {
    print("Error getting user data: $e");
    throw e;
  }
}

Future addUserData(String id, BillData data) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? currentJwt = prefs.getString('jwt');
    
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/users/addData'),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $currentJwt',
      },
      body: jsonEncode(<String, dynamic>{
        'id': id,
        'data': data.toJson(data),
      }),
    );
    
    Map<String, dynamic> responseData = jsonDecode(response.body);
    return responseData['success'];
  } catch (e) {
    print("Error adding user data: $e");
    throw e;
  }
}

