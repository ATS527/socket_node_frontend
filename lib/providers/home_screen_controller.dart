import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_chat/models/chat_model.dart';
import 'package:socket_chat/models/user_model.dart';

final homeScreenController = Provider<HomeScreenController>((ref) {
  return HomeScreenController();
});

class HomeScreenController  {
  HomeScreenController();

  List<ChatModel> generateChats(UserModel currentUser) {
    if (currentUser.name == "ATS527") {
      return ats527Chats;
    } else if (currentUser.name == "MJK618") {
      return mjkChats;
    } else {
      return juxtnChats;
    }
  }

  List<ChatModel> ats527Chats = [
    ChatModel(
        name: "ali",
        isGroup: false,
        currentMessage: "hello ats",
        id: 4,
        time: "16:04"),
    ChatModel(
        name: "mjk",
        isGroup: false,
        currentMessage: "hello ats",
        id: 2,
        time: "16:04"),
    ChatModel(
        name: "juxtn",
        isGroup: false,
        currentMessage: "hello ats",
        id: 3,
        time: "16:04"),
  ];

  List<ChatModel> mjkChats = [
    ChatModel(
        name: "ats",
        isGroup: false,
        currentMessage: "hello mjk",
        id: 1,
        time: "16:04"),
    ChatModel(
        name: "stephan",
        isGroup: false,
        currentMessage: "hello mjk",
        id: 5,
        time: "16:04"),
    ChatModel(
        name: "juxtn",
        isGroup: false,
        currentMessage: "hello mjk",
        id: 3,
        time: "16:04"),
  ];

  List<ChatModel> juxtnChats = [
    ChatModel(
        name: "ali",
        isGroup: false,
        currentMessage: "hello juxtn",
        id: 4,
        time: "16:04"),
    ChatModel(
        name: "stephan",
        isGroup: false,
        currentMessage: "hello juxtn",
        id: 5,
        time: "16:04"),
    ChatModel(
        name: "mjk",
        isGroup: false,
        currentMessage: "hello juxtn",
        id: 2,
        time: "16:04"),
    ChatModel(
        name: "ats",
        isGroup: false,
        currentMessage: "hello juxtn",
        id: 1,
        time: "16:04"),
  ];
}
