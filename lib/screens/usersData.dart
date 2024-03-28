import 'package:electric/resources/changingDatabase.dart';
import 'package:electric/widgets/billAdmin.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({Key? key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  String userId = '';
  dynamic userData;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    userId = ModalRoute.of(context)?.settings.arguments as String;
    userData = await getUserData(userId);
    print("the user id is: ");
    print(userId);
    print(userData);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User Data'),
        ),
        body: Center(
            child: ListView.builder(
          itemCount: userData['data'].length,
          itemBuilder: (context, index) {
            return billCardAdmin(
                jsonData: Map<String, dynamic>.from(userData['data'][index]));
          },
        )),
      ),
    );
  }
}
