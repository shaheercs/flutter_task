import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_task/screens/login_screen.dart';
import 'package:flutter_task/screens/registration_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF1B254F),
          accentColor: Colors.blueGrey,
          scaffoldBackgroundColor: Color(0xFF1B254F),
          textSelectionColor: Colors.blueGrey,
          highlightColor: Colors.blueGrey),
      home: LoginScreen(),
      routes: {
        '/registration': (context) => RegistrationScreen(),
        '/login': (context) => LoginScreen()
      },
    );
  }
}
