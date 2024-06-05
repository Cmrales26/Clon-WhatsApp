import 'package:flutter/material.dart';
import 'package:whastsapp/Pages/IndividualChatPage.dart';
import 'package:whastsapp/model/chatmodel.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.chatmodel});
  final ChatModel chatmodel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Chat(chatModel: chatmodel)));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              child: Icon(
                chatmodel.isGroup ? Icons.groups : Icons.person,
                color: Colors.white,
                size: 37,
              ),
            ),
            title: Text(
              chatmodel.name,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            subtitle: Row(
              children: [
                const Icon(
                  Icons.done_all,
                  size: 16,
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 3,
                ),
                Text(
                  chatmodel.CurrentMessage,
                  style: const TextStyle(fontSize: 13, color: Colors.white),
                ),
              ],
            ),
            trailing: Text(
              chatmodel.time,
              style: const TextStyle(color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }
}
