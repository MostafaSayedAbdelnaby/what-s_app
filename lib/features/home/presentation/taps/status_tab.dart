import 'dart:math';
import 'package:flutter/material.dart';
import 'package:whats_app/core/resources/assets_manager.dart';
import 'package:whats_app/core/resources/color_manager.dart';
import 'package:whats_app/core/resources/font_manager.dart';
import 'package:whats_app/features/home/presentation/widgets/single_status_item.dart';
import '../../../../core/resources/chat_user.dart';

class StatusTab extends StatefulWidget {
  const StatusTab({super.key});

  @override
  State<StatusTab> createState() => _StatusTabState();
}

class _StatusTabState extends State<StatusTab> {
  late List viewedUsers;
  late List mutedUsers;

  @override
  void initState() {
    super.initState();

    final random = Random();
    viewedUsers = [];
    mutedUsers = [];

    for (var user in chatUsers) {
      if (random.nextBool()) {
        viewedUsers.add(user);
      } else {
        mutedUsers.add(user);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: FontSize.s16, vertical: FontSize.s8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Color(0xff128C7E),
                      foregroundColor: Color(0xff128C7E),
                      radius: 30,
                      backgroundImage: AssetImage(ImageAssets.profile),
                    ),
                    Positioned(
                      top: 40,
                      left: 40,
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: ColorManager.green,
                        child: Icon(
                          Icons.add,
                          size: FontSize.s20,
                          color: ColorManager.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      'My Status',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: FontSize.s17),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 2.0),
                      child: Text(
                        'Tap to add status update',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: FontSize.s16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Viewed updates
            if (viewedUsers.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(
                    top: FontSize.s8, bottom: FontSize.s8),
                child: Text(
                  'Viewed updates',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: FontSize.s16),
                ),
              ),

            for (var user in viewedUsers)
              Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 30,
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage: NetworkImage(user.imageUrl),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListTile(
                      title: Text(
                        user.chatTitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: FontSize.s16),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 2.0),
                        child: Text(
                          '7 minutes ago',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(fontSize: FontSize.s12,),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            // Since the ExpansionTile has top and bottom borders by default and we don't want that so we
            //use Theme to override its dividerColor property
            // Muted updates
            if (mutedUsers.isNotEmpty)
              Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ExpansionTile(
                  // textColor: Colors.black,
                  textColor: Theme.of(context).textTheme.bodySmall?.color,
                  tilePadding: const EdgeInsets.all(0.0),
                  title: Text(
                    'Muted updates',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontSize: FontSize.s16),
                  ),
                  children: [
                    for (var user in mutedUsers)
                      SingleStatusItem(
                        statusTitle: user.chatTitle,
                        statusTime: '10 minutes ago',
                        statusImage: user.imageUrl,
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
