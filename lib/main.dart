import 'package:flutter/material.dart';
import 'package:to_do_app/screens/home_screen.dart';
import 'package:to_do_app/utils/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        primaryColor: Colors.white,
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      routes: {
        AppRoutes.HOME_PAGE: (ctx) => const HomeScreen(),
      }, // FloatingActionButton
      debugShowCheckedModeBanner: false,
    );
  }
}
