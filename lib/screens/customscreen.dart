import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class CustomScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50), // DRIVE ON Text
            Center(
              child: RichText(
                text:  TextSpan(
                  children: [
                    TextSpan(
                      text: 'DRIVE ',
                      style: GoogleFonts.luckiestGuy(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'ON',
                      style: GoogleFonts.luckiestGuy(
                        fontSize: 35,
                        
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Image with the character and stopwatch
            Center(
              child: Image.asset(
                'assets/images/watch.png', // Replace with your image asset
                height: 300,
              ),
            ),
            const SizedBox(height: 30),
            // Always On Time, Everytime Text with padding
             Padding(
              padding: const EdgeInsets.only(left: 20.0), // Adjust left padding as needed
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'ALWAYS ON TIME,',
                      style: GoogleFonts.luckiestGuy(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: '\nEVERYTIME',
                      style: GoogleFonts.luckiestGuy(
                        fontSize: 25,  
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Subheading Text with padding
           const  Padding(
              padding: const EdgeInsets.only(left: 20.0), // Adjust left padding as needed
              child: Text(
                'Punctual rides you can rely on.\n'
                'Get to your destination safely\n'
                'and right on schedule, every time',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'serif',
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            // Circular button with arrow
            
          ],
        ),
      ),
    );
  }
}
