import 'package:electric/resources/changingDatabase.dart';
import 'package:electric/screens/usersData.dart';
import 'package:flutter/material.dart';

class HouseCard extends StatefulWidget {
  final int indexNumber;
  final String houseNumber;
  final String email;
  final String userId;

  const HouseCard({
    Key? key,
    required this.indexNumber,
    required this.houseNumber,
    required this.email,
    required this.userId,
  }) : super(key: key);

  @override
  State<HouseCard> createState() => _HouseCardState();
}

class _HouseCardState extends State<HouseCard> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
          elevation: 6, // Slightly stronger shadow
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              title: Text(
                'House Number: ${widget.houseNumber}',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text('Index: ${widget.indexNumber}'),
                  Text('Email: ${widget.email}'),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            print(widget.userId);
                            Map<String, dynamic> userData =
                                await getUserData(widget.userId);
                            print(userData);
                          },
                          child: Text('Test')),
                      ElevatedButton.icon(
                        onPressed: () {
                          // On pressed route it to '/User/bills
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DataScreen(),
                              settings: RouteSettings(arguments: widget.userId),
                            ),
                          );
                        },
                        icon: const Icon(Icons.more_horiz),
                        label: const Text('More'),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: const Text('Add New Data'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
