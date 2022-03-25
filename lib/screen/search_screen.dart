import 'package:deneme_1/providers/mobile_screen_app_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Color.fromARGB(224, 136, 46, 128),
          actions: [],
          title: Center(
            child: Text(
              'Ara',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
