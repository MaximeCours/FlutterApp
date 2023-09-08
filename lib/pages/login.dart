import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rendu/models/user.dart';
import 'package:rendu/services/user_service.dart';
import 'package:rendu/utils/padding_styles.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  UserService userService = UserService();

  void onLogin(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      userService
          .login(_usernameController.text, _passwordController.text)
          .then((value) {
        if (value != null) {
          Navigator.pushReplacementNamed(context, '/user', arguments: value);
          Fluttertoast.showToast(
              msg: "Login success", backgroundColor: Colors.green);
        } else {
          Fluttertoast.showToast(
              msg: "Login failed", backgroundColor: Colors.red);
        }
      });
    } else {
      Fluttertoast.showToast(msg: "Invalid form", backgroundColor: Colors.red);
    }
  }

  onRegister(context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      userService
          .createUser(User(
              userId: 0,
              userName: _usernameController.text,
              userPassword: _passwordController.text))
          .then((value) {
        if (value > 0) {
          Fluttertoast.showToast(
              msg: "Register success", backgroundColor: Colors.green);
        } else {
          Fluttertoast.showToast(
              msg: "Register failed", backgroundColor: Colors.red);
        }
      });
    } else {
      Fluttertoast.showToast(msg: "Invalid form", backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    userService.getUsers().then((value) => print(value));
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "Login Page",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )),
        Padding(
            padding: ThemePaddingStyles.paddingAround,
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Image.asset("lib/assets/cat.jpg"),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      hintText: "Username",
                      labelText: "Username",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter username";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                onRegister(context);
              },
              child: const Text('Register'),
            ),
            ElevatedButton(
              onPressed: () {
                onLogin(context);
              },
              child: const Text('Login'),
            ),
          ],
        )
      ],
    ));
  }
}
