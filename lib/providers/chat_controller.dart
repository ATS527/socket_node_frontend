import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_chat/models/message_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

final chatController = ChangeNotifierProvider<ChatController>((ref) {
  return ChatController();
});


class ChatController extends ChangeNotifier {

  late io.Socket socket;

  List<MessageModel> messages = [];

  void connectSocket(int senderUserId) {
    socket =
        io.io("https://rocky-sierra-05106.herokuapp.com", <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket.connect();
    socket.onConnect((data) {
      // print("connected");
      socket.on("message", (msg) {
        // print(msg);
        setMessage("destination", msg["message"]);
        update();
      });
    });
    socket.emit("signin", senderUserId);
  }

  void sendMessage(String message,int senderUserId,int receiptUserId) {
    setMessage("source", message);
    socket.emit("message", {
      "message": message,
      "sourceId": senderUserId,
      "targetId": receiptUserId
    });
    update();
  }

  void setMessage(String type, String message) {
    MessageModel messageModel = MessageModel(type: type, message: message);
    messages.add(messageModel);
  }

  void update () {
    notifyListeners();
  }
}
