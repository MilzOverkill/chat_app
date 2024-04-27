import 'package:chatapp/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../pages/home_page.dart';
//shortcut slt for sudden launch of class

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
        //user is logged in

          if (snapshot.hasData) {
            return const HomePage();
          }

          // user is Not logged in

          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}

/// constantly listening if we're signed in or not and checks it