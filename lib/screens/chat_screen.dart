import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_chat/providers/chat_controller.dart';
import 'package:socket_chat/widgets/own_message_card.dart';
import 'package:socket_chat/widgets/reply_message_card.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen(
      {Key? key,
      required this.name,
      required this.senderUserId,
      required this.receiverUserId})
      : super(key: key);

  final String name;
  final int senderUserId;
  final int receiverUserId;

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  late TextEditingController _messageController;

  late ChatController _chatController = ref.read(chatController);

  @override
  void initState() {
    _messageController = TextEditingController();
    _chatController.connectSocket(widget.senderUserId);
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _chatController = ref.watch(chatController);
    print("Chat Screen Built");
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 10,
              child: ListView.builder(
                  itemCount: _chatController.messages.length,
                  itemBuilder: (context, index) {
                    final message = _chatController.messages[index];
                    if (message.type == "source") {
                      return OwnMessageCard(
                          message: message.message, time: "16:04");
                    } else if (message.type == "destination") {
                      return ReplyMessageCard(
                          message: message.message, time: "16:04");
                    } else {
                      return const SizedBox();
                    }
                  }),
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: MediaQuery.of(context).size.width * 0.8,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: _messageController,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _chatController.sendMessage(_messageController.text,
                          widget.senderUserId, widget.receiverUserId);
                      _messageController.clear();
                    },
                    icon: const Icon(Icons.send),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
