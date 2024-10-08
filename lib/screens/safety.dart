import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bolt_clone/screens/login.dart';


class SafetyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // Aligns content at the top
          crossAxisAlignment: CrossAxisAlignment.start, // Aligns text to the left
          children: [
            SizedBox(height: 51), // Add some space from the very top of the screen
            // DRIVE ON Text
            Center(
              child: RichText(
                text: TextSpan(
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
            SizedBox(height: 20),
            // Safety First Box
            Center(
              child: Image.asset(
                'assets/images/safety.png', // Replace with your image asset
                height: 300,
              ),
            ),
            SizedBox(height: 0),
            // Your Safety, Our Priority Text with Left Padding
            Padding(
              padding: const EdgeInsets.only(left: 20.0), // Add padding to move the text slightly from the left
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'YOUR SAFETY,\n',
                      style: GoogleFonts.luckiestGuy(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'OUR PRIORITY',
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
            SizedBox(height: 10),

            // Subtitle Text with Left Padding
            Padding(
              padding: const EdgeInsets.only(left: 20.0), // Add padding to move the text slightly from the left
              child: Text(
                'Trusted drivers, real-time tracking,\n'
                'and safe rides—wherever you\'re headed,\n'
                'we\'re here to get you there safely\n'
                'and on time.',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'serif',
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(), // Pushes the button to the bottom
            // Centered Get Started Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );// Handle button press
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'GET STARTED',
                  style: GoogleFonts.luckiestGuy(
                    fontSize: 20,
                    
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 25), // Add some space at the bottom
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SafetyScreen(),
  ));
}
