import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rendu/models/user.dart';
import 'package:rendu/services/user_service.dart';
import 'package:rendu/utils/padding_styles.dart';

class EditUserPage extends StatefulWidget {
  const EditUserPage({super.key});

  @override
  State<EditUserPage> createState() => _EditUserPage();
}

class _EditUserPage extends State<EditUserPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  UserService userService = UserService();


  void onSubmit(context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      final newUser = User(id: user.id, userId: user.userId, userName: _usernameController.text, userPassword: user.userPassword);
      userService
          .updateUser(newUser)
          .then((value) {
        if (value > 0) {
          Navigator.pushReplacementNamed(context, '/user', arguments: newUser);
          Fluttertoast.showToast(
              msg: "Update success", backgroundColor: Colors.green);
        } else {
          Fluttertoast.showToast(
              msg: "Update failed", backgroundColor: Colors.red);
        }
      });
    } else {
      Fluttertoast.showToast(msg: "Invalid form", backgroundColor: Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Edit user"),
          Form(
              key: _formKey,
              child: Padding(
                padding: ThemePaddingStyles.paddingAround,
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                  ),
                ),
              )),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onSubmit(context);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
