import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Welcome Back!',
          style: GoogleFonts.luckiestGuy(
            color: Colors.yellow,
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.yellow),
            onPressed: () {
              // Navigate to Profile page
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            // "Your Ride Awaits"
            Text(
              'Your Ride Awaits,',
              style: GoogleFonts.luckiestGuy(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
            Text(
              'Ready to Drive On?',
              style: GoogleFonts.luckiestGuy(
                fontSize: 24,
                color: Colors.yellow,
              ),
            ),
            SizedBox(height: 40),

            // Menu Buttons
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildMenuButton(
                    title: 'Start a Ride',
                    icon: Icons.directions_car,
                    onTap: () {
                      // Navigate to Start a Ride page
                    },
                  ),
                  _buildMenuButton(
                    title: 'View Rides',
                    icon: Icons.history,
                    onTap: () {
                      // Navigate to View Rides page
                    },
                  ),
                  _buildMenuButton(
                    title: 'History',
                    icon: Icons.timeline,
                    onTap: () {
                      // Navigate to History page
                    },
                  ),
                  _buildMenuButton(
                    title: 'Settings',
                    icon: Icons.settings,
                    onTap: () {
                      // Navigate to Settings page
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Rides',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Handle bottom navigation tap
        },
      ),
    );
  }

  // Function to build each menu button
  Widget _buildMenuButton({required String title, required IconData icon, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.black),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
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
    home: HomeScreen(),
  ));
}
