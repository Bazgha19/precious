// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:precious/login/login.dart';
import 'package:precious/login/loginmain.dart';
import 'package:precious/screens/games.dart';
import 'package:precious/screens/home.dart';
import 'package:precious/screens/maps.dart';
import 'package:precious/screens/notes.dart';
import 'package:precious/screens/reminders.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Precious',
      // home: LoginPage(),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  final screen = [
    Home(),
    Notes(),
    Reminders(),
    Games(),
    Maps(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.brown.shade100,
        selectedItemColor: Colors.brown.shade500,
        unselectedItemColor: Colors.brown.shade300,
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined), label: 'Notes'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined), label: 'Reminders'),
          BottomNavigationBarItem(
              icon: Icon(Icons.videogame_asset_outlined), label: 'Play'),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
        ],
      ),
    );
  }
}
