import 'package:flutter/material.dart';
import 'package:whats_app/core/resources/assets_manager.dart';
import 'package:whats_app/core/resources/color_manager.dart';
import 'package:whats_app/core/resources/font_manager.dart';
import 'package:whats_app/features/chat_screen/widgets/chat_message.dart';
import 'package:whats_app/features/chat_screen/widgets/app_bar_chat.dart';
import 'package:whats_app/features/chat_screen/widgets/bottom_nav_chat.dart';

class ChatScreen extends StatefulWidget {
  final Map arguments;

  const ChatScreen({super.key, required this.arguments});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, dynamic>> _messages = []; // {text, isSender}

  void _addMessage(String text) {
    setState(() {
      _messages.add({
        "text": text,
        "isSender": true,
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final String name = widget.arguments['name'] ?? 'Unknown';
    final String imageUrl = widget.arguments['imageUrl'] ?? '';

    return Container(
      decoration: BoxDecoration(
        color: ColorManager.transparent,
        image: const DecorationImage(
          image: AssetImage(ImageAssets.whatsappGrayBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: true,
        appBar: AppBarChat(
          imageUrl: imageUrl,
          name: name,
        ),
        body: Column(
          children: [
            // show Message that send
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(FontSize.s16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: FontSize.s6),
                    child: ChatMessage(
                      message: msg["text"],
                      isSender: msg["isSender"],
                    ),
                  );
                },
              ),
            ),

            // input Messages
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: FontSize.s16,
                vertical: FontSize.s20,
              ),
              child: BottomNavChat(onSend: _addMessage),
            )
          ],
        ),
      ),
    );
  }
}