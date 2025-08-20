import 'package:flutter/material.dart';
import 'package:whats_app/core/resources/color_manager.dart';
import 'package:whats_app/core/resources/font_manager.dart';

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
            padding: const EdgeInsets.all(FontSize.s16),
            decoration: BoxDecoration(
              color: isSender
                  ? Theme.of(context).dividerColor
                  : Theme.of(context).primaryColorLight,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(FontSize.s16),
                bottomLeft: Radius.circular(FontSize.s16),
                bottomRight: Radius.circular(FontSize.s16),
              ),
            ),
            child: image
                ? Image.asset(message)
                : Text(
                    message,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: FontSize.s14,
                          color: isSender ? ColorManager.black : ColorManager.white,
                        ),
                  ),
          ),
        ),
      ],
    );
  }
}
