import 'package:flutter/material.dart';
import 'package:whats_app/core/resources/font_manager.dart';

class SingleChatWidget extends StatelessWidget {
  final String? chatMessage;
  final String? chatTitle;
  final Color? seenStatusColor;
  final String? imageUrl;
  final Function onTap;

  const SingleChatWidget({
    super.key,
    this.chatMessage,
    this.chatTitle,
    this.seenStatusColor,
    this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(imageUrl!),
        ),
        Expanded(
          child: ListTile(
            onTap: () => onTap(),
            title: Text(
              '$chatTitle',
              style:Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: FontSize.s16
              ),
            ),
            subtitle: Row(children: [
              Icon(
                seenStatusColor == Colors.blue ? Icons.done_all : Icons.done,
                size: 15,
                color: seenStatusColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 6.0),
                  child: Text(
                    '$chatMessage',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                  ),
                ),
              ),
            ]),
            trailing: Column(
              children: [
                Padding(
                  padding:  const EdgeInsets.only(top: FontSize.s8),
                  child: Text(
                    'Yesterday',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
