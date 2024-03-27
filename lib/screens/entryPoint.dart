import "package:electric/resources/AuthMethods.dart";
import "package:flutter/material.dart";

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with bubbles
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.green],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          // Centered button
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Add your button functionality here
                AuthMethods().simpleGetRequest();
              },
              child: Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}