import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class VerificationPage extends StatefulWidget {
  final String verificationId; // Expect this to be passed from the login page

  VerificationPage({required this.verificationId});

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  // Function to verify OTP
  Future<void> _verifyOTP(String otp) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otp,
    );

    try {
      setState(() {
        _isLoading = true; // Show loading indicator
      });
      
      // Sign in with the provided credential (OTP)
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      
      if (userCredential.user != null) {
        // Handle successful login
        print('OTP Verified. User signed in!');
        Navigator.pop(context); // Redirect to the home page or any other page
      }
    } catch (e) {
      print('Error verifying OTP: $e');
      setState(() {
        _isLoading = false; // Stop loading indicator if there's an error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            // "DRIVE ON" Title
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
            SizedBox(height: 50),
            // Instruction text
            Text(
              'We just sent a magic code to',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            // Display a dynamic phone number if available
            Text(
              '+233 000 0000',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Check your messages and\ninput it below to unlock your ride!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 40),
            // OTP TextField
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: _otpController,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
                maxLength: 6, // OTP is generally 6 digits
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter OTP',
                  counterText: '', // Hide the counter
                ),
              ),
            ),
            SizedBox(height: 40),
            // Verify Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : () {
                        // Call the OTP verification function
                        String otp = _otpController.text.trim();
                        if (otp.length == 6) {
                          _verifyOTP(otp);
                        } else {
                          print("Please enter a valid 6-digit OTP");
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: _isLoading
                    ? CircularProgressIndicator(color: Colors.black)
                    : Text(
                        'VERIFY',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: VerificationPage(verificationId: 'your_verification_id'), // Replace with actual verificationId
  ));
}
