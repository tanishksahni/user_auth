import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool isobscureText;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.isobscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        obscureText: isobscureText,
        controller: controller,
        cursorColor: Colors.grey.shade700,
        decoration: InputDecoration(
            hintText: hintText,
            labelStyle: TextStyle(color: Colors.grey.shade700),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade700, width: 0.5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade700, width: 0.5),
            )),
      ),
    );
  }
}
