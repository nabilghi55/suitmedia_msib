import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:msib_suitmedia/src/first_screen.dart';
import 'package:msib_suitmedia/src/second_screen.dart';
import 'package:msib_suitmedia/src/third_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Suitmedia_MSIB_Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          useMaterial3: true,
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 43, 99, 123),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))))),
      initialRoute: '/',
      routes: {
        FirstScreen.route: (context) => FirstScreen(),
        SecondScreen.route: (context) => SecondScreen(),
        ThirdScreen.route: (context) => ThirdScreen(),
      },
    );
  }
}
