import 'package:bolt_clone/screens/customscreen.dart';
import 'package:bolt_clone/screens/safety.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextScreen extends StatefulWidget {
  @override
  _NextScreenState createState() => _NextScreenState();
}

class _NextScreenState extends State<NextScreen> {
  // Create a PageController to manage the PageView
  final PageController _pageController = PageController();
  int _currentPage = 0; // To track the current page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            // PageView for swiping between pages
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: [
                // First Page Content
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50), // Add some space at the top
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
                      Image.asset(
                        'assets/images/car.png', // Replace with your car image URL
                        height: 300,
                      ),
                      SizedBox(height: 0),
                      Text(
                        'BOOK A RIDE',
                        style: GoogleFonts.luckiestGuy(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 1),
                      Text(
                        'IN JUST FEW STEPS',
                        style: GoogleFonts.luckiestGuy(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 226, 191, 35),
                        ),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Set your location,\npick your ride,\nand enjoy your journey.\nIt\'s that simple and quick.',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'serif',
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // You can add more pages here
                CustomScreen(),
                SafetyScreen(),
                 // Example of another screen
              ],
            ),
          ),
          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) => buildDot(index, context)),
          ),
          SizedBox(height: 20), // Add spacing at the bottom
        ],
      ),
    );
  }

  // Method to build dots indicator
  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? Colors.yellow : Colors.grey,
      ),
    );
  }
}
