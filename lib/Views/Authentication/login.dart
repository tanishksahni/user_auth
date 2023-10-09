import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_auth/Views/Authentication/Components/myButton.dart';
import 'package:user_auth/Views/Authentication/Components/myTextField.dart';
import 'package:user_auth/Views/Authentication/Components/squareTile.dart';

class LoginScreen extends StatefulWidget {
  final Function() onTap;
  LoginScreen({super.key, required this.onTap});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text- editing controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // sign user in method
  void signUserIn() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    // //pop the loading circle
    // Navigator.pop(context);

    //try sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      // Pop the loading circle
      Navigator.pop(context);

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Authentication failed: ${e.message}')));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // logo
                Icon(
                  Icons.logo_dev,
                  size: 100,
                ),
                const SizedBox(height: 50),
                Text(
                  'Welcome Back Tanishk!',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                const SizedBox(height: 25),
                // Email/ username TextField
                MyTextField(
                  controller: _emailController,
                  hintText: 'Email',
                  isobscureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Password TextField
                MyTextField(
                  controller: _passwordController,
                  hintText: 'Password',
                  isobscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                // // Forgot Password
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 25),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: [
                //       TextButton(
                //         style: TextButton.styleFrom(padding: EdgeInsets.zero),
                //         child: Text(
                //           'Forgot Password?',
                //           style: TextStyle(color: Colors.grey.shade700),
                //         ),
                //         onPressed: () {},
                //       ),
                //     ],
                //   ),
                // ),

                //signin button
                MyButton(
                  onTap: signUserIn,
                  text: 'Sign In',
                ),

                const SizedBox(height: 50),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(children: [
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    )),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        )),
                    Expanded(
                        child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ))
                  ]),
                ),
                SizedBox(
                  height: 50,
                ),
                //google and apple button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //google button
                    SquareTile(imagePath: 'assets/images/Google.webp'),

                    SizedBox(
                      width: 10,
                    ),

                    //apple button
                    SquareTile(imagePath: 'assets/images/Apple.png'),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        " Sign Up",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
