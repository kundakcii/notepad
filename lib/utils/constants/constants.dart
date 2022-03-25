import 'package:deneme_1/screen/add_screen.dart';
import 'package:deneme_1/screen/note_list_screen.dart';
import 'package:deneme_1/screen/search_screen.dart';
import 'package:flutter/material.dart';

const MOBILE_SCREEN_APP_BAR = '/home';
const LOGIN_SCREEN = '/login';

List<Widget> homeScreenItems = [
  AddScreen(),
  const NotListScreen(),
  const SearchScreen(),
];
