import 'package:flutter/material.dart';
import 'core/resources/theme_provider.dart';
import 'core/routes_manager/route_generator.dart';
import 'core/routes_manager/routes.dart';
import 'package:provider/provider.dart';

import 'core/theme/dark_theme.dart';
import 'core/theme/light_theme.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: LightTheme().themeData,
      darkTheme: DarkTheme().themeData,
      themeMode: themeProvider.themeMode,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.chatList,
    );
  }
}
