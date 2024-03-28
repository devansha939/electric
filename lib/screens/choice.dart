import "package:flutter/material.dart";

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({super.key});

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            child: Text('Consumer'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/admin');
            },
            child: Text('Admin'),
          ),
        ],
      ),
    );
  }
}