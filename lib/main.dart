import 'package:flutter/material.dart';
import 'package:flutter_whatsapp_clone/splash_screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      theme: ThemeData(
        primaryColor: Color(0xff006257),
        accentColor: Color(0xff006257)
      ),
    );
  }
}
