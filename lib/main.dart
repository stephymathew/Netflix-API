import 'package:flutter/material.dart';
import 'package:netflix_api/core/colors/colors.dart';
import 'package:netflix_api/presentation/main_page/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),
       scaffoldBackgroundColor:backGroundColor,
        colorScheme: ColorScheme.fromSeed(seedColor:Colors.black),
       textTheme: const TextTheme(
        bodyLarge:TextStyle(
          color: Colors.white
        ) ,
        bodyMedium: TextStyle(
          color: Colors.white
        )
       ),
        useMaterial3: true,
      ),
      home:  ScreenMainPage(),
    );
  }
}




 