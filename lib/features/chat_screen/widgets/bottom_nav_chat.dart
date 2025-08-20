import 'package:flutter/material.dart';
import 'package:whats_app/core/resources/assets_manager.dart';
import 'package:whats_app/core/resources/color_manager.dart';
import 'package:whats_app/core/resources/font_manager.dart';
import 'package:whats_app/features/chat_screen/widgets/send_message.dart';

class BottomNavChat extends StatefulWidget {
  final Function(String) onSend; // callback

  const BottomNavChat({super.key, required this.onSend});

  @override
  State<BottomNavChat> createState() => _BottomNavChatState();
}

class _BottomNavChatState extends State<BottomNavChat> {
  final TextEditingController _controller = TextEditingController();

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSend(text); // send for chat
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            cursorColor: ColorManager.white,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: FontSize.s16,
            ),
            decoration: InputDecoration(
              hintText: "Type a Message ...",
              prefixIcon: const Icon(Icons.camera_alt_outlined),
              suffixIcon: SendMessage(onSend: _handleSend),
            ),
          ),
        ),
        const SizedBox(width: FontSize.s6),
        CircleAvatar(
          radius: 22,
         backgroundColor: ColorManager.green,
          child: ImageIcon(
            const AssetImage(IconsAssets.iconMic),
            color: Theme.of(context).primaryColorLight,
            size: 26,
          ),
        )
      ],
    );
  }
}
