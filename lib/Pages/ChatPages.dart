import 'package:flutter/material.dart';
import 'package:whastsapp/Components/CustomCard.dart';
import 'package:whastsapp/model/chatmodel.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
      name: 'Nelson',
      icon: 'assets/images/user.png',
      isGroup: false,
      time: '11:30',
      CurrentMessage: "Hello, how are you",
    ),
    ChatModel(
      name: 'Diana V',
      icon: 'assets/images/user.png',
      isGroup: false,
      time: '4:30',
      CurrentMessage: "Hello, I love you",
    ),
    ChatModel(
      name: 'Sharith Blanco',
      icon: 'assets/images/user.png',
      isGroup: false,
      time: '5:30',
      CurrentMessage: "Hello, I hate yoy",
    ),
    ChatModel(
      name: 'Andrea Valderrama',
      icon: 'assets/images/user.png',
      isGroup: false,
      time: '4:30',
      CurrentMessage: "Hello, I want you",
    ),
    ChatModel(
      name: 'Shirley',
      icon: 'assets/images/user.png',
      isGroup: false,
      time: '22:30',
      CurrentMessage: "Hello, My friend",
    ),
    ChatModel(
      name: 'Friends',
      icon: 'assets/images/user.png',
      isGroup: true,
      time: '22:30',
      CurrentMessage: "Hello, My friends",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(
            side: BorderSide(width: 2, color: Colors.transparent)),
        backgroundColor: Theme.of(context).hintColor,
        onPressed: () {},
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) => CustomCard(
          chatmodel: chats[index],
        ),
      ),
    );
  }
}
