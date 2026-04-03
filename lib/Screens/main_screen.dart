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
          Padding(
            padding: const EdgeInsets.only(top: 50,right: 20,left: 20),
            child: Column(
             children: [
               Text(
                 "SLH(Sydney Luxury Hire)",
                 style: TextStyle(
                   fontSize: 20,
                   fontStyle: FontStyle.italic,
                   fontWeight: FontWeight.bold,
                   fontFamily: "Poppins",
                   color: Color(0xFF000000),
                 ),
               ),
             ],
            ),
          ),
        ],
      ),
    );
  }
}
