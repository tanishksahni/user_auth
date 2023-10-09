import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:user_auth/Views/Authentication/Components/myButton.dart';
import 'package:user_auth/Views/Authentication/Components/myTextField.dart';
import 'package:user_auth/Views/Authentication/Components/squareTile.dart';

class SignUpScreen extends StatefulWidget {
  final Function() onTap;
  SignUpScreen({super.key, required this.onTap});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //text- editing controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    //show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    //try creating the user
    try {
      //check if password is confirmed
      if (_passwordController.text == _confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
      } else {
        //show error message
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Password does not  match")));
      }
      //pop the loading circle
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Pop the loading circle
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Sign up failed: ${e.message}')));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                  "Let's create an account for you!",
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
                // Confirm Password TextField
                MyTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm Password',
                  isobscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                // Forgot Password
                //signin button
                MyButton(
                  onTap: signUserUp,
                  text: 'Sign Up',
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
                    Text("Already have an account?"),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        " Login Now",
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
