import 'package:flutter/material.dart';

class main_screen extends StatelessWidget {
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
              Container(
                padding: EdgeInsets.only(top: 70),
                alignment: Alignment.center,
                child: Image(image: AssetImage("assets/images/slhlogo.png")),
              ),
              const SizedBox(height: 35),
              Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "SLH(Sydney Luxury Hire)",
                      style: TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        fontFamily: "Poppins",
                        color: Color(0xFF000000),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Welcome to our car rental service!.",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Poppins",
                        color: Color(0xFF000000),
                      ),
                    ),
                  ],
                ),
              ),
               const SizedBox(height: 50),
               Container(
                 height: 300,
                 child: Stack(
                   children: [
                     Transform.translate(
                       offset: Offset(MediaQuery.of(context).size.width * -0.20, 0),
                       child: Image(
                         image: AssetImage("assets/images/frontcarimg.png"),
                         height: 400,
                         width: MediaQuery.of(context).size.width,
                         fit: BoxFit.contain,
                       ),
                     ),
                   ],
                 ),
               ),
                const SizedBox(height: 50),

              ElevatedButton(
                onPressed: () {
                },
                style:ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF000000).withOpacity(0.7),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
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
