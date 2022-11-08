import 'package:app_quanlythietbi/home/home.dart';
import 'package:app_quanlythietbi/screens/login.dart';
import 'package:app_quanlythietbi/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      initialRoute: Login_Screen.id,
      routes: {
        Login_Screen.id: (context) => Login_Screen(),
        Register_Screen.id: (context) => Register_Screen(),
        home_Screen.id: (context) => home_Screen(),
      },
    );
  }
}
