import 'package:deneme_1/providers/intro_screen_provider.dart';
import 'package:deneme_1/providers/mobile_screen_app_bar_provider.dart';
import 'package:deneme_1/providers/user_provider.dart';
import 'package:deneme_1/responsive/layout_screen.dart';
import 'package:deneme_1/screen/login_screen.dart';
import 'package:deneme_1/utils/constants/constants.dart';
import 'package:deneme_1/widgets/mobile_screen_app_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialise app based on platform- web or mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyAg11rIkqprlQF-Hwx1wWUfdYplnOFfO-w",
          projectId: "deneme-1-42f2e",
          storageBucket: "deneme-1-42f2e.appspot.com",
          messagingSenderId: "908095518222",
          appId: "1:908095518222:web:243448fefd477ce4df6e5f"),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    MultiProvider(
      child: MyApp(),
      providers: [
        ChangeNotifierProvider<IntroProvider>(
          create: (context) => IntroProvider(),
        ),
        ChangeNotifierProvider<MobileScreenAppBarProvider>(
          create: (context) => MobileScreenAppBarProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
      ],
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          MOBILE_SCREEN_APP_BAR: (context) => MobileScreenAppBar(),
          LOGIN_SCREEN: ((context) => LoginScreen())
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: const LayoutScreen());
  }
}
