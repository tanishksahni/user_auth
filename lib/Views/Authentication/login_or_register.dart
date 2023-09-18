import 'package:flutter/material.dart';
import 'package:user_auth/Views/Authentication/login.dart';
import 'package:user_auth/Views/Authentication/signup.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  //initially show the login page 
  bool showLoginPage = true;

  //toggle between login and register page 
  void togglePages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(onTap: togglePages);
    } else { 
      return SignUpScreen(onTap: togglePages);
    }

  }
}