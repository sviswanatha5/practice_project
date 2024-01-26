import 'package:flutter/material.dart';
import 'package:practice_project/components/my_button.dart';
import 'package:practice_project/components/my_test_field.dart';
import 'package:practice_project/components/square_tile.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  //sign user
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            const SizedBox(height: 50),

            //logo

            const Icon(
              Icons.lock,
              size: 100,
            ),

            const SizedBox(height: 50),

            const Text(
              'Welcome back!',
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color: Color.fromARGB(255, 101, 100, 100),
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            //username

            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),

            //password

            const SizedBox(height: 10),

            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            //forgot password

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                Text(
                  'Forgot Password?',
                  style: TextStyle(color: Color.fromARGB(255, 117, 117, 117)),
                ),
              ]),
            ),

            const SizedBox(height: 25),

            // MyButton(onTap: signUserIn()),

            const SizedBox(height: 50),

            // For google sign in

            const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SquareTile(imagePath: 'lib/images/google.png'),
            ])
          ],
        )),
      ),
    );
  }
}
