import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isSender;
  final bool image;

  const ChatMessage(
      {super.key,
      required this.message,
      required this.isSender,
      this.image = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isSender ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        /// Flexible equivalence Expanded
        Flexible(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:
                  isSender ? const Color(0xff168C4B) : const Color(0xff232D36),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: image
                ? Image.asset(message)
                : Text(
                    message,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color(0xffFFFFFF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}
