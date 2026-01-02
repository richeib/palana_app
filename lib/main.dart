import 'package:flutter/material.dart';
import 'package:palana/palana_app/ui/screens/account_screen.dart';
import 'package:palana/palana_app/ui/screens/home_screen.dart';
import 'package:palana/palana_app/ui/screens/library_screen.dart';
import 'package:palana/palana_app/ui/screens/login_screen.dart';
import 'package:palana/palana_app/ui/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Palana Neurosync',
      theme: ThemeData(
        primaryColor: const Color(0xFF9C27B0),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/library': (context) => const LibraryScreen(),
        '/home': (context) => const HomeScreen(),
        '/account': (context) => const AccountScreen(),
      },
    );
  }
}

