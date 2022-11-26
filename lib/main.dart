import 'package:flutter/material.dart';
import 'package:jemputah_app/screens/base_screen.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JemputAh App',
      home: const SplashScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          displayMedium: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
