import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final dynamic controller;
  final String hintText;
  final bool obscureText;

  const MyTextField({
    super.key, 
    required this.controller, 
    required this.hintText, 
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField( 
        obscureText: obscureText,
        controller: controller,
        decoration: const InputDecoration(
           enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 189, 189, 189),
            ),
          ),
          fillColor: Color.fromARGB(255, 238, 238, 238),
          filled: true,
        ),
      ),
    );
  }
}
