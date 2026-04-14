import 'package:flutter/material.dart';
import 'info_screen.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/health.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Overlay for dark effect
          Container(
            color: Colors.black.withOpacity(0.5),
          ),

          // Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  "VitaTrack",
                  style: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),

                SizedBox(height: 20),

                Text(
                  "Track Your Life Smartly",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),

                SizedBox(height: 40),

                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      children: [
                        Text("Developed by: Sanika Deshmukh"),
                        Text("Guided by: Dr. Rupa S. Karnik"),
                        Text("PG Department of Computer Science"),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 40),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => InfoScreen()),
                    );
                  },
                  child: Text("Get Started"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}