import 'package:flutter/material.dart';
import 'package:user_auth/Views/Authentication/auth_page.dart';
import 'package:user_auth/Views/Home/home.dart';

import 'Views/Authentication/login.dart';
import 'Views/Authentication/signup.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UserAuth',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      initialRoute: '/auth',
      routes: {
        '/auth': (context) => AuthPage(),
        '/home': (context) => Home(),
        // '/login': (context) => LoginScreen(),
        // '/signup': (context) => SignupScreen(),
      },
    );
  }
}
