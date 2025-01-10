import 'package:flutter/material.dart';

class Getstarthome extends StatelessWidget {
  const Getstarthome({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIy0gQLmVdKxviA3PkgjWAOGhtaPgMCshFBw&s', // Test with a different URL
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
           Positioned(
            top: screenSize.height * 0.02, 
            left: screenSize.width * 0.04, 
            child: Image.asset(
              'assets/images/logo.png',
              width: screenSize.width * 0.3, 
              height: screenSize.width * 0.3,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: Colors.black, // Text color
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w500, // Text bold
                    ),
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: Text('Get Started'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}