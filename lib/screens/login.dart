import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bolt_clone/screens/otp.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatelessWidget {
  final TextEditingController _phoneController = TextEditingController();

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
            // "Let's Go" Title
            Center(
              child: RichText(
                text:  TextSpan(
                  children: [
                    TextSpan(
                      text: "LET'S ",
                      style: GoogleFonts.luckiestGuy(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'GO',
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
            // Character Image (replace with your image)
            Image.asset(
              'assets/images/flying man.png', // Path to your image
              height: 200,
            ),
            SizedBox(height: 30),
            // Phone Number Input Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 54, 54, 54),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/ghana flag.png', // Replace with your flag image
                    height: 24,
                  ),
                  SizedBox(width: 10),
                  Text(
                    '+233',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _phoneController,
                      style: TextStyle(color: Colors.white),
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone Number',
                        hintStyle: TextStyle(color: Colors.white54),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Sign In Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async{
                 String phone = '+233' + _phoneController.text.trim();
                  await _signInWithPhone(context, phone);// Handle sign in action
                },
                child: Text(
                  'SIGN IN',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // Divider with "OR"
            Row(
              children: [
                Expanded(
                  child: Divider(
                    color: Colors.white54,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'OR',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white54,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Sign In with Google
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: Image.asset(
                  'assets/images/google icon.jpg', // Path to your Google logo
                  height: 24,
                ),
                onPressed: () {
                  // Handle sign in with Google
                },
                label: Text(
                  'Sign In with Google',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            // Sign In with Facebook
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                icon: Image.asset(
                  'assets/images/facebook logo.png', // Path to your Facebook logo
                  height: 24,
                ),
                onPressed: () {
                  // Handle sign in with Facebook
                },
                label: Text(
                  'Sign In with Facebook',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Spacer(),
            // Footer Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                "By hopping on board, you agree to our Rules of Road and Privacy Pit Stops. Over 18? Great! We'll send you the latest updates and cool offers—but no worries, you can hit the brakes on those anytime in your settings.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
  Future<void> _signInWithPhone(BuildContext context, String phoneNumber) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Auto-retrieval of the code
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        } else {
          print('Error: ${e.message}');
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        // Redirect to OTP page with verificationId
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationPage(
              verificationId: verificationId,
            ),
          ),
        );
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
