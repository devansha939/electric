import "package:flutter/material.dart";

// Admin side individual bill card

class billCardAdmin extends StatefulWidget {
  final Map<String, dynamic> jsonData;
  billCardAdmin({
    Key? key,
    required this.jsonData,
  }) : super(key: key);

  @override
  State<billCardAdmin> createState() => _billCardAdminState();
}

class _billCardAdminState extends State<billCardAdmin> {
  @override
@override
Widget build(BuildContext context) {
  return Column(
    children: [
      SizedBox(height: 10),
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date of Issue: ${widget.jsonData['dateOfIssue']}'),
            Text('Consumer Name: ${widget.jsonData['consumerName']}'),
            Text('Net Payable: ${widget.jsonData['netPayable']}'),
            Text('End Date: ${widget.jsonData['endDate']}'),
            
          ],
        ),
      ),
      SizedBox(height: 10),
    ],
  );
}
}
