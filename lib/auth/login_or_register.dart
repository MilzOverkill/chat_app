import 'package:chatapp/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/pages/login_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  // initially show login page

  bool showLoginPage = true;

  // toggle between login and register page
  void togglepage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(
        onTap: togglepage,
      );
      
    } else {
      return RegisterPage(
        onTap: togglepage,
      );
    }
  }
}
