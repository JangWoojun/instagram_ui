import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'instagram_body.dart';

void main() {
  runApp(const InstagramCloneApp());
}

class InstagramCloneApp extends StatelessWidget {
  const InstagramCloneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            colorScheme: const ColorScheme.light(
                primary: Colors.white, secondary: Colors.black),
            useMaterial3: true,
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: Colors.black,
            )),
        home: const InstagramCloneHome());
  }
}

class InstagramCloneHome extends StatefulWidget {
  const InstagramCloneHome({super.key});

  @override
  State<InstagramCloneHome> createState() => _InstagramCloneHomeState();
}

class _InstagramCloneHomeState extends State<InstagramCloneHome> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index == 0 ? AppBar(
        title: Text(
          "Instagram",
          style: GoogleFonts.lobsterTwo(color: Colors.black, fontSize: 32),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_outline, size: 32),
            onPressed: () {
              print("favorite_outline");
            },
          ),
          IconButton(
            icon: const Icon(
              CupertinoIcons.paperplane,
              size: 32,
            ),
            onPressed: () {},
          ),
        ],
      ) : null,
      body: InstagramBody(index: index),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 28,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 28,
              ),
              label: "Search"),
        ],
      ),
    );
  }
}
