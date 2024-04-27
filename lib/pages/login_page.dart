import 'package:chatapp/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  //email and password text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  //tap to go to register
  void Function()? onTap;

  LoginPage({super.key, required this.onTap});

  //login method
  void login(BuildContext context) async {
    //auth service
    final authService = AuthService();

    //try login

    try {
      await authService.signInWithEmailPassword(
        _emailController.text,
        _pwController.text,
      );
    }

    //catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(e.toString()),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        //logo

        Icon(
          Icons.message,
          size: 60,
          color: Theme.of(context).colorScheme.primary,
        ),

        const SizedBox(
          height: 50,
        ),

        //welcome back message

        Text(
          "welcome back, you've been missed",
          style: TextStyle(
            fontSize: 16,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),

        const SizedBox(
          height: 50,
        ),

        // email textfield

        MyTextField(
          hintText: "Email",
          obscureText: false,
          controller: _emailController,
        ),

        const SizedBox(
          height: 10,
        ),

        // password textfield
        MyTextField(
          hintText: "Password",
          obscureText: true,
          controller: _pwController,
        ),

        const SizedBox(
          height: 20,
        ),

        //login button

        MyButton(
          text: "Login",
          onTap: () => login(context),
        ),

        const SizedBox(
          height: 25,
        ),

        //register now

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Not a member? ",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            GestureDetector(
              onTap: onTap,
              child: const Text(
                " Register now ",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )

        //register now button
      ]),
    );
  }
}
