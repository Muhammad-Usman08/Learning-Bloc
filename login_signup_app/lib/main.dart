import 'package:flutter/material.dart';
import 'package:login_signup_app/ui/login_view.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginView(),
      debugShowCheckedModeBanner: false,
    );
  }
}