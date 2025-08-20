import 'package:flutter/material.dart';
import 'package:whats_app/core/resources/chat_user.dart';
import 'package:whats_app/core/routes_manager/routes.dart';
import 'package:whats_app/features/home/presentation/widgets/single_chat_widget.dart';

class ChatsTab extends StatelessWidget {
  const ChatsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorManager.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: chatUsers.length,
          itemBuilder: (context, index) {
            final chatUser = chatUsers[index];
            return SingleChatWidget(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  Routes.chatRoute,
                  arguments: {
                    'name': chatUser.chatTitle,
                    'imageUrl': chatUser.imageUrl,
                  },
                );
              },
              chatTitle: chatUser.chatTitle,
              chatMessage: 'I wish GoT had better ending',
              seenStatusColor: Colors.blue,
              imageUrl: chatUser.imageUrl,
            );
          },
        ),
      ),
    );
  }
}
