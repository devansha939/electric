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
  Widget build(BuildContext context) {
    return Text("bell");
    // ListView.builder(
    //     itemCount: widget.jsonData.length,
    //     itemBuilder: (context, index) {
    //       // String key = widget.jsonData.keys.elementAt(index);
    //       // dynamic value = widget.jsonData[key];
    //       return (Text("Hello"));
    //       //  ListTile(
    //       // title: Text(key),
    //       // subtitle: Text(value.toString()),
    //     });
  }
}
