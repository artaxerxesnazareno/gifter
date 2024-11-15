import 'package:flutter/material.dart';
import 'package:gifter/view/pages/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

  
void main() async {
  // Carrega as variáveis de ambiente antes de iniciar o app
  await dotenv.load(fileName: ".env");
 

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gifter',
      theme: ThemeData(
        highlightColor: Colors.white,
        hintColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const Homepage(),
    );
  }
}
