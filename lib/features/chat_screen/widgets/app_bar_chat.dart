import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app/core/resources/color_manager.dart';
import 'package:whats_app/core/resources/font_manager.dart';
import 'package:whats_app/core/resources/theme_provider.dart';

class AppBarChat extends StatelessWidget implements PreferredSizeWidget {
  final String imageUrl;
  final String name;

  const AppBarChat({
    super.key,
    required this.imageUrl,
    required this.name,
  });

  @override
  Size get preferredSize => const Size.fromHeight(68);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return AppBar(
      toolbarHeight: 68,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: Row(
        children: [
          SizedBox(
            height: 42,
            width: 42,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: FontSize.s12),
          Text(
            name,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 16,
                color: provider.themeMode == ThemeMode.light
                    ? ColorManager.black
                    : ColorManager.white),
          ),
        ],
      ),
      actions: [
        const Icon(CupertinoIcons.phone, size: FontSize.s24),
        const SizedBox(width: FontSize.s12),
        const Icon(CupertinoIcons.video_camera, size: FontSize.s28),
        PopupMenuButton(
          color: Theme.of(context).primaryColorLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(FontSize.s16),
          ),
          itemBuilder: (context) {
            return [
              PopupMenuItem(
                onTap: () {
                  print("object");
                },
                child: Text(
                  "search",
                  style: TextStyle(
                      color: provider.themeMode == ThemeMode.light
                          ? ColorManager.black
                          : ColorManager.white),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  "Ahmed",
                  style: TextStyle(
                      color: provider.themeMode == ThemeMode.light
                          ? ColorManager.black
                          : ColorManager.white),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  "data",
                  style: TextStyle(
                      color: provider.themeMode == ThemeMode.light
                          ? ColorManager.black
                          : ColorManager.white),
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}
