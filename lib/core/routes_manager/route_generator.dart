import 'package:flutter/material.dart';
import 'package:whats_app/core/routes_manager/routes.dart';
import 'package:whats_app/features/chat_screen/chat_screen.dart';
import 'package:whats_app/features/home/presentation/chat_list.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.chatRoute:
        if (settings.arguments is Map) {
          return MaterialPageRoute(
            builder: (_) => ChatScreen(arguments: settings.arguments as Map),
          );
        }
        return MaterialPageRoute(builder: (_) => const ChatScreen(arguments: {},));
      case Routes.chatList:
        return MaterialPageRoute(builder: (_) =>  ChatList());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(child: Text('No Route Found')),
      ),
    );
  }
}