import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({Key? key}) : super(key: key);

  @override
  _ChoiceScreenState createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900, // Gives a dark theme background
      appBar: AppBar(
        title: Text(
          'Welcome!',
          style: GoogleFonts.lato(color: Colors.white, fontSize: 28), // Using Google Fonts for better typography
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          width: 600, // Set a fixed width for larger screens
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.85),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                spreadRadius: 1,
                blurRadius: 20,
                offset: Offset(0, 8), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                'Choose User Type',
                style: GoogleFonts.lato(fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              _buildChoiceButton(title: 'Consumer', route: '/home'),
              const SizedBox(height: 20),
              _buildChoiceButton(title: 'Admin', route: '/admin'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChoiceButton({required String title, required String route}) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.teal,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
        textStyle: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Text(title),
    );
  }
}

