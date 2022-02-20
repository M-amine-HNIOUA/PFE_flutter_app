// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:your_employee/Screens/ChatPage/ChatPage.dart';
import 'package:your_employee/Screens/FavoritePage/FavoritePage.dart';
import 'package:your_employee/Screens/ProfilePage/ProfilePage.dart';
import 'package:your_employee/Screens/SearchPage/SearchPage.dart';
import 'Screens/HomePage/Homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.lightBlue,
        systemNavigationBarColor: Colors.lightBlue,
      ),
    );
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/Chat': (context) => ChatPage(),
        '/Search': (context) => SearchPage(),
        '/Favorite': (context) => FavoritePage(),
        '/Profile': (context) => ProfilePage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Employee Finder App',
      theme: ThemeData(
        // brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(Colors.white.value),
        appBarTheme: AppBarTheme(
          color: Color(Colors.white.value),
          elevation: 0.0,
        ),
      ),
      home: HomePage(),
    );
  }
}
