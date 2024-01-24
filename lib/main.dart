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
        ),
        home: Scaffold(
          appBar: AppBar(
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
                icon: const Icon(CupertinoIcons.paperplane, size: 32,),
                onPressed: () {
                  print("paperplane");
                },
              ),
            ],
          ),
          body: const InstagramCloneHome(),
        ));
  }
}

class InstagramCloneHome extends StatelessWidget {
  const InstagramCloneHome({super.key});

  @override
  Widget build(BuildContext context) {
    return InstagramBody();
  }
}
