import 'package:electric/resources/changingDatabase.dart';
import 'package:electric/widgets/billAdmin.dart';
import 'package:flutter/material.dart';

class DataScreen extends StatefulWidget {
  final String userId;
  const DataScreen({Key? key, required this.userId});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  dynamic userData;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    print("the user id is as follwos: $widget.userId");
    userData = await getUserData(widget.userId);
    setState(() {}); // Trigger a rebuild after fetching data
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('User Data'),
        ),
        body: Center(
          child: userData == null
              ? Text('No data', style: TextStyle(fontSize: 20))
              // : Text(
              //     'Data length: ${userData['data'].length}',
              //     style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              // )
              : ListView.builder(
                  itemCount: userData['data'].length,
                  itemBuilder: (context, index) {
                    return billCardAdmin(
                        jsonData:
                            Map<String, dynamic>.from(userData['data'][index]));
                  },
                ),
        ),
      ),
    );
  }
}
