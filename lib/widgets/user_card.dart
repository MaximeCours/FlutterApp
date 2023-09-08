import 'package:flutter/material.dart';
import 'package:rendu/models/user.dart';

class UserCard extends StatelessWidget {
  final User? user;

  const UserCard({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text("Bonjour ${user?.userName} (${user?.userId})")),
        Center(child: Text("Votre mot de passe est : ${user?.userPassword}")),
        Center(child: TextButton(onPressed: () {
          Navigator.pushReplacementNamed(context, '/login');
        }, child: const Text("Logout"))),
      ],
    );
  }
}
