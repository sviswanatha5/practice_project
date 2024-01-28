import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("LOGGED IN")),
      appBar: AppBar(actions: [
        IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))
      ]),
    );
  }
}
