import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'all_news_home.dart';
import 'news_data_provider.dart';
import 'splash_screen.dart';

main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>NewsDataProvider())
      ],
      child: My_News()));
}

class My_News extends StatelessWidget {
  const My_News({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash_Screen(),
    );
  }
}
