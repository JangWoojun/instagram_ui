import 'package:flutter/material.dart';
import 'package:instagram_ui/screen/home_screen.dart';
import 'package:instagram_ui/screen/search_screen.dart';

class InstagramBody extends StatelessWidget {
  final int index;

  const InstagramBody({required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    if (index == 0) {
      return const HomeScreen();
    }
    return const SearchScreen();
  }
}
