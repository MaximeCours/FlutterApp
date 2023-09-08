import 'package:flutter/material.dart';
import 'package:rendu/pages/edit_user.dart';
import 'package:rendu/pages/login.dart';
import 'package:rendu/pages/user.dart';

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
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/user': (context) => const UserPage(),
        '/user_edit': (context) => EditUserPage()
      },
    );
  }
}
