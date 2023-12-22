import 'package:flutter/material.dart';
import 'package:project_mobile/home.dart';
import 'package:project_mobile/upload.dart';
import 'package:project_mobile/print.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(title: 'Project Mobile'),
          '/upload': (context) => const UploadImagess(),
          '/print': (context) => const Print(),
        });
  }
}
