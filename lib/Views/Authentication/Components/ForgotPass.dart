
import 'package:flutter/material.dart';


class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final TextEditingController emailController = TextEditingController();

  void resetPassword() async {
    String email = emailController.text.trim();

    // try {
    //   await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Password reset email sent. Check your email inbox.'),
    //     ),
    //   );
    // } catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(
    //       content: Text('Error sending password reset email: $e'),
    //     ),
    //   );
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kSecondaryColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const SizedBox(
              height: 60,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset Password',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),
                ),
                Text(
                  'Please enter your Registered Email\nso we can send a reset link',
                  style: TextStyle(fontWeight: FontWeight.w300,fontSize: 14),
                  // style: GoogleFonts.raleway(
                  //   fontSize: 16,
                  //   //color: kTextColor,
                  // ),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'example@gmail.com',
                    fillColor: Colors.transparent,
                    filled: true,
                    prefixIcon: const Icon(
                      Icons.email,
                      //color: kTextColor,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        //color: kTextColor,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        //color: kTextColor,
                      ),
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                resetPassword();
              },
              child: Center(
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Center(
                    child: Text(
                      'Send Link',
                      style: TextStyle(color: Colors.white),
                      // style: GoogleFonts.raleway(
                      //     fontSize: 20,
                      //     color: kSecondaryColor,
                      //     fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
              ),
            ),
            //SizedBox(height: 0,)
          ],
        ),
      ),
    );
  }
}
