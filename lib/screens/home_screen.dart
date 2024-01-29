import 'package:flutter/material.dart';
import 'package:practice_project/components/my_button.dart';
import 'package:practice_project/components/my_test_field.dart';
import 'package:practice_project/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  final Function()? onTap;
  const HomeScreen({super.key, required this.onTap});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user
  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    Navigator.pop(context);

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (exception) {
      Navigator.pop(context);
      if (exception.code == 'user-not-found') {
        //print('No user found/ wrong email');

        wrongInputMessage();
      } else if (exception.code == 'wrong-password') {
        //print('Wrong password');

        wrongInputMessage();
      }
    }
  }

  void wrongInputMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Incorrect Email'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
            child: SingleChildScrollView(
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
                controller: emailController,
                hintText: 'Email',
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

              MyButton(onTap: () => {signUserIn()}),

              const SizedBox(height: 25),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Color.fromARGB(255, 97, 93, 93),
                        thickness: 0.5,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or continue with',
                        style:
                            TextStyle(color: Color.fromARGB(255, 66, 65, 65)),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Color.fromARGB(255, 97, 93, 93),
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // For google sign in

              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SquareTile(imagePath: 'lib/images/google.png'),
              ]),

              const SizedBox(height: 30),

              // end of UI, asks for registration
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text('Not a member? ',
                    style: TextStyle(color: Color.fromARGB(255, 97, 93, 93))),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: onTap,
                  child: const Text(
                    'Register Now',
                    style: TextStyle(
                        color: Color.fromARGB(255, 21, 101, 192),
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ])
            ],
          ),
        )),
      ),
    );
  }
}
