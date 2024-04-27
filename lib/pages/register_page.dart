import 'package:chatapp/auth/auth_service.dart';
import 'package:chatapp/components/my_button.dart';
import 'package:chatapp/components/my_textfield.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  //email and password text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _confirmpwController = TextEditingController();

  //tap to go to register page
  final void Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  //register method

  void register(BuildContext context) {
    //get auth service
    final _auth = AuthService();
    

    //if passwords match create user

    if (_pwController.text == _confirmpwController.text) {
      try {
        _auth.signInWithEmailPassword(
          _emailController.text,
          _pwController.text,
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    // if passwords don't match  show error to user
    else{
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Passwords don't match"),
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
          "Let's create an account for you",
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
          height: 10,
        ),

        // confirm password textfield
        MyTextField(
          hintText: "Confirm Password",
          obscureText: true,
          controller: _confirmpwController,
        ),

        const SizedBox(
          height: 25,
        ),

        //login button

        MyButton(
          text: "Register",
          onTap: () => register(context),
        ),

        const SizedBox(
          height: 25,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already have an account? ",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
            GestureDetector(
              onTap: onTap,
              child: Text(
                " login now ",
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
