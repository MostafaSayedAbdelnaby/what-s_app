import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app/core/resources/color_manager.dart';
import 'package:whats_app/core/resources/font_manager.dart';
import 'package:whats_app/core/resources/theme_provider.dart';
import 'package:whats_app/core/widgets/nav_item.dart';
import 'package:whats_app/features/home/presentation/taps/chats_tab.dart';
import 'package:whats_app/features/home/presentation/taps/status_tab.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  TextEditingController controller = TextEditingController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        actions: [
          const Icon(Icons.photo_camera_outlined),
          PopupMenuButton(
            color: Theme.of(context).primaryColorLight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(FontSize.s20),
            ),
            onSelected: (value) {
              if (value == 'light') {
                themeProvider.setTheme(ThemeMode.light);
              } else if (value == 'dark') {
                themeProvider.setTheme(ThemeMode.dark);
              }
            },
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: 'light',
                  child: Text('Light Theme',
                      style: TextStyle(
                          color: themeProvider.themeMode == ThemeMode.light
                              ? ColorManager.black
                              : ColorManager.white)),
                ),
                PopupMenuItem(
                  value: 'dark',
                  child: Text('Dark Theme',
                      style: TextStyle(
                          color: themeProvider.themeMode == ThemeMode.light
                              ? ColorManager.black
                              : ColorManager.white)),
                ),
              ];
            },
          ),
        ],
        title: const Text('WhatsApp'),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(FontSize.s8),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: 'Search',
              prefixIcon: const Icon(Icons.search_outlined,size: FontSize.s28,),
              fillColor: Theme.of(context).hoverColor,
            ),
          ),
        ),
        Expanded(child: tabs[currentIndex])
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "chats",
            icon: NavItem(Icons.chat_outlined, isSelected: currentIndex == 0),
          ),
          BottomNavigationBarItem(
            label: "Status",
            icon: NavItem(Icons.access_time_outlined,
                isSelected: currentIndex == 1),
          ),
          BottomNavigationBarItem(
            label: "calls",
            icon: NavItem(Icons.call_outlined, isSelected: currentIndex == 2),
          ),
        ],
        enableFeedback: false,
      ),
    );
  }

  List<Widget> tabs = [
    ChatsTab(),
    StatusTab(),
    StatusTab(),
  ];
}
