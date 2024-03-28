import 'package:electric/resources/changingDatabase.dart';
import 'package:electric/widgets/snackBar.dart';
import 'package:flutter/material.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({Key? key}) : super(key: key);

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController houseNumberController = TextEditingController();
  String userType = 'Consumer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create User'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: houseNumberController,
              decoration: InputDecoration(labelText: 'House Number'),
            ),
            DropdownButton<String>(
              value: userType,
              onChanged: (String? value) {
                setState(() {
                  userType = value!;
                });
              },
              items: <String>['Consumer', 'Admin'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Confirm User Creation'),
                      content:
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Are you sure you want to create the following user?'),
                              Text('Email: ${emailController.text}'),
                              Text('House Number: ${houseNumberController.text}'),
                              Text('User Type: $userType'),
                            ],
                          ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            createUser(
                              emailController.text,
                              houseNumberController.text,
                              userType,
                            ).then((responseData) {
                              if (responseData['status'] == 'success') {
                                showSnackBar(
                                    context, "User created successfully!");
                                Navigator.pushNamed(context, '/home');
                              }
                            }).catchError((error) {
                              // Handle error
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text('Confirm'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Create User'),
            ),
          ],
        ),
      ),
    );
  }
}
