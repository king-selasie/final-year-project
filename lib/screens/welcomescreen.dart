import 'dart:async'; // For the timer
import 'package:flutter/material.dart';
import 'package:bolt_clone/screens/nextscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the next screen after 4 seconds
    Timer(Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => NextScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'DRIVE ',
                style: GoogleFonts.luckiestGuy(
                  fontSize: 40,
                  
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: 'ON',
                style: GoogleFonts.luckiestGuy(
                  fontSize: 40,
                  
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow, // Make "ON" yellow
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
