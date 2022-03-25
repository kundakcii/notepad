import 'package:deneme_1/providers/intro_screen_provider.dart';
import 'package:deneme_1/utils/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Consumer(
            builder: (context, IntroProvider _introProvider, child) => PageView(
              controller: _introProvider.getPageController,
              children: [
                _page(
                  'Merhaba',
                  Colors.yellow,
                ),
                _page('Hayatımızdaki önemli noktaları not almamız gerekebilir',
                    Colors.pink),
                _page('Bende not alma uygulaması geliştirmek istedim',
                    Color.fromARGB(255, 15, 190, 103)),
                _page('Not almanın renkli yolu...',
                    Color.fromARGB(255, 187, 94, 7)),
              ],
            ),
          ),
          bottomSheet: Container(
            color: Colors.blueAccent,
            height: 70,
            child: Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Consumer(
                      builder: (context, IntroProvider _introProvider, child) =>
                          TextButton(
                        onPressed: () {
                          _introProvider.getPageController.previousPage(
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.bounceInOut,
                          );
                        },
                        child: const Text(
                          'GERİ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Consumer(
                      builder: (context, IntroProvider _introProvider, child) =>
                          SmoothPageIndicator(
                        controller: _introProvider.getPageController,
                        count: 4,
                        effect: const JumpingDotEffect(
                            dotHeight: 16,
                            dotWidth: 16,
                            jumpScale: .7,
                            verticalOffset: 15,
                            dotColor: Colors.white),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Consumer(
                      builder: (context, IntroProvider _introProvider, child) {
                        return TextButton(
                          onPressed: () {
                            if (_introProvider.getPageController.page == 3) {
                              Navigator.pushReplacementNamed(
                                  context, LOGIN_SCREEN);
                            } else {
                              _introProvider.getPageController.nextPage(
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.bounceInOut,
                              );
                            }
                          },
                          child: const Text(
                            'GEÇ',
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

Widget _page(String s, Color color) {
  return Container(
    color: color,
    child: Center(
      child: Text(
        s,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 35,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
