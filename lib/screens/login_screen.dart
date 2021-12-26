import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_chat/providers/login_controller.dart';
import 'package:socket_chat/screens/home_screen.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  late LoginController _loginController;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    _loginController = ref.read(loginController);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: ListView.builder(
        itemCount: _loginController.users.length,
        itemBuilder: (context, index) {
          final user = _loginController.users[index];
          return ListTile(
            title: Text(user.name),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
