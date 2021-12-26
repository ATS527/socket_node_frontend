import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:socket_chat/models/chat_model.dart';
import 'package:socket_chat/models/user_model.dart';
import 'package:socket_chat/providers/home_screen_controller.dart';
import 'package:socket_chat/screens/chat_screen.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen(this.currentUser, {
    Key? key,
  }) : super(key: key);

  final UserModel currentUser;
  late HomeScreenController _homeScreenController;
  late List<ChatModel> chats;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    _homeScreenController = ref.watch(homeScreenController);
    chats = _homeScreenController.generateChats(currentUser);
    print("Home Screen Built");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.message),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            title: Text(chat.name),
            subtitle: Text(chat.currentMessage),
            trailing: Text(chat.time),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatScreen(
                  name: chat.name,
                  senderUserId: currentUser.id,
                  receiverUserId: chat.id,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
