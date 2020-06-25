import 'package:flutter/material.dart';

import 'play.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      color: const Color(0xFFFDF626),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: size.width,
            height: size.height / 1.6,
            child: Image.asset('assets/images/icon2048.png', fit: BoxFit.cover),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 88),
            width: size.width,
            height: 60,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              splashColor: Colors.white,
              color: const Color(0xFF21242E),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Play())),
              child: const Text("Play",
                  style: TextStyle(color: Colors.blue, fontSize: 23)),
            ),
          ),
//          SizedBox(height: 10),
//          Container(
//            margin: EdgeInsets.symmetric(horizontal: 50),
//            width: size.width,
//            height: 60,
//            child: RaisedButton(
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.circular(8),
//              ),
//              splashColor: Colors.white,
//              color: Color(0xFF21242E),
//              onPressed: () {},
//              child: const Text("Continue",
//                  style: TextStyle(color: Colors.blue, fontSize: 23)),
//            ),
//          )
        ],
      ),
    );
  }
}
