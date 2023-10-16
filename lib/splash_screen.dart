import 'dart:async';

import 'package:flutter/material.dart';

import 'all_news_home.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
  Timer(Duration(seconds: 3), () {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AllNews()));
  });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Image.asset("assets/splash_image/splash_image.jpg", fit: BoxFit.fill,),
      ),

    );
  }
}
