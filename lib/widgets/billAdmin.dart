import "package:electric/screens/editData.dart";
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

  void edit(BuildContext context){
  Navigator.pushNamed(context, '/editData', arguments: {'data': widget.jsonData}); 
}
@override
Widget build(BuildContext context) {
  return Column(
  children: [
    SizedBox(height: 10),
    Container(
      padding: EdgeInsets.all(20), // Increased padding for better spacing
      decoration: BoxDecoration(
        color: Colors.white, // Added a background color for contrast
        border: Border.all(color: Colors.grey.shade300), // Lighter grey border
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200, // Soft shadow for depth
            blurRadius: 5,
            offset: Offset(0, 3), // Slight shadow offset
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Date of Issue: ${widget.jsonData['dateOfIssue']}',
            style: TextStyle(fontSize: 16), // Larger font size for readability
          ),
          SizedBox(height: 5), // Added space between text lines
          Text(
            'Consumer Name: ${widget.jsonData['consumerName']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'Net Payable: ${widget.jsonData['netPayable']}',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 5),
          Text(
            'End Date: ${widget.jsonData['endDate']}',
            style: TextStyle(fontSize: 16),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.edit), // Pencil icon can be 'Icons.edit'
              onPressed: () {
                // Navigate to the new page here
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditScreen(data: widget.jsonData)), 
                );
              },
            ),
          ),
        ],
      ),
    ),
    SizedBox(height: 10),
  ],
);

}
}
