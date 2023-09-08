import 'package:flutter/material.dart';
import 'package:rendu/models/user.dart';
import 'package:rendu/widgets/user_card.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPage();
}

class _UserPage extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    final User user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      body: UserCard(user: user),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/user_edit', arguments: user);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
