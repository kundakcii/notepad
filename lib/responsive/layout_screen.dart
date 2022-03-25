import 'package:deneme_1/screen/landing_screen.dart';
import 'package:deneme_1/screen/web_screens/web_login_screen.dart';
import 'package:deneme_1/widgets/mobile_screen_app_bar.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth > 600) {
          return WebLoginScreen();
        } else {
          return LandingScreen();
        }
      },
    );
  }
}
