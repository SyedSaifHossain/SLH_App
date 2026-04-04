import 'package:flutter/material.dart';

import 'home_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/backgroundimg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
                const SizedBox(height: 80),
              Image(
                image: AssetImage("assets/images/slhlogo.png"),
                width: 150,
                height: 50,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "SYDNEY LUXURY HIRE (SLH)",
                      style: TextStyle(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Color(0xFF0f0c0c),
                      ),
                    ),
                    Text(
                      "Wheels on",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Open Sauce",
                        color: Color(0xFF0f0c0c),
                      ),
                    ),
                    Text(
                      "Demand.",
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Open Sauce",
                        color: Color(0xFF0f0c0c),
                        height: 0.7,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Your Trusted Partner for Luxury Car Rental.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Open Sauce",
                        color: Color(0xFF0f0c0c),
                      ),
                    ),
                  ],
                ),
              ),

               const SizedBox(height: 15),
               Container(
                 height: 250,
                 child: Stack(
                   children: [
                     Transform.translate(
                       offset: Offset(MediaQuery.of(context).size.width * -0.25, 0),
                       child: Image(
                         image: AssetImage("assets/images/frontcarimg.png"),
                         width: MediaQuery.of(context).size.width,
                         fit: BoxFit.contain,
                       ),
                     ),
                   ],
                 ),
               ),

                const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                style:ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF000000).withOpacity(0.3),
                  foregroundColor: Color(0xFF000000),
                  padding: EdgeInsets.symmetric(horizontal: 13, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  textStyle: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Open Sauce",
                  ),
                ),
                child: Text("Get Started"),
              ),

            ],
          ),
        ],
      ),
    );
  }
}