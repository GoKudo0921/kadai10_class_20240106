import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kadai10_class_20240106/view/screen.dart';
import 'package:kadai10_class_20240106/view/start_up/login_page.dart';
import 'view/time_line/time_line_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}
