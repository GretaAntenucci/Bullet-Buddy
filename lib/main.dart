import 'package:bullet_buddy/pages/custom_bottom_bar.dart';
import 'package:bullet_buddy/pages/create_account_page.dart';
import 'package:bullet_buddy/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => const LoginPage(),
        '/create': (context) => const CreateAccountPage(),
        '/bottom': (context) => const CustomBottomBar(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Bullet Buddy',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
