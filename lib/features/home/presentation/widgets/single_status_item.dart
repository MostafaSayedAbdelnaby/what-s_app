import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whats_app/core/resources/color_manager.dart';
import 'package:whats_app/core/resources/font_manager.dart';
import 'package:whats_app/core/resources/theme_provider.dart';

class SingleStatusItem extends StatelessWidget {
  final String? statusTitle;
  final String? statusTime;
  final String? statusImage;

  const SingleStatusItem({
    super.key,
    this.statusTitle,
    this.statusTime,
    this.statusImage,
  });

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);

    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 30,
              child: CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage('$statusImage'),
              ),
            ),
          ],
        ),
        Expanded(
          child: ListTile(
            title: Text('$statusTitle',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: FontSize.s16,
                      color: provider.themeMode == ThemeMode.light
                          ? ColorManager.black
                          : ColorManager.white,
                    )),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Text("$statusTime",
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: FontSize.s12,
                        color: provider.themeMode == ThemeMode.light
                            ? ColorManager.black
                            : ColorManager.white,
                      )),
            ),
          ),
        ),
      ],
    );
  }
}
