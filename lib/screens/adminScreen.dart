import "dart:convert";

import "package:electric/widgets/houseCard.dart";
import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:shared_preferences/shared_preferences.dart";

class AdminScreen extends StatefulWidget {
   AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  List<dynamic> userData = [];

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jwtToken = prefs.getString('jwt');

    final response = await http.get(
      Uri.parse('http://localhost:3000/api/users/Users'),
      headers: {
        'Authorization': 'Bearer $jwtToken',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        userData = data;
      });
    } else {
      print('Failed to fetch user data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Data'),
      ),
      body: ListView.builder(
        itemCount: userData.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> user = userData[index];
          return HouseCard(
            indexNumber: index,
            houseNumber: user['houseNumber'],
            email: user['email'],
            userId: user['_id'],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {

          // route to '/admin/new'
          Navigator.pushNamed(context, '/admin/new');
        },
        label: Text(
          'Add New User',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
