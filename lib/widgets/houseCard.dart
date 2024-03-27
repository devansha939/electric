import "package:flutter/material.dart";

class HouseCard extends StatefulWidget {
  final int indexNumber;
  final int houseNumber;
  final String name;

  const HouseCard({Key? key, required this.indexNumber, required this.houseNumber, required this.name}) : super(key: key);

  @override
  State<HouseCard> createState() => _HouseCardState();
}

class _HouseCardState extends State<HouseCard> {
  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
        Text('Index: ${widget.indexNumber}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text('House Number: ${widget.houseNumber}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text('Name: ${widget.name}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}