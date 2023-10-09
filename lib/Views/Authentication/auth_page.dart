import 'package:flutter/material.dart';
import 'package:user_auth/Views/Authentication/login.dart';
import 'package:user_auth/Views/Authentication/login_or_register.dart';
import 'package:user_auth/Views/Home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: LoginOrRegister(),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(), 
        builder: (context, snapshot){
          //user logged in 
          if(snapshot.hasData) {
            return Home();
          }
          //user not logged in 
          else {
            return LoginOrRegister();
          }
        }
      ),
    );
  }
}