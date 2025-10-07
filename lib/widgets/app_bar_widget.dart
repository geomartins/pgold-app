import 'package:hexcolor/hexcolor.dart';
import 'package:pgold/config/enumefy.dart';
import 'package:pgold/config/palletefy.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget> actions;
  final bool automaticallyImplyLeading;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final double? size;
  final bool centerTitle;
  final Color? bgColor;
  final Color? textColor;
  final Widget? titleWidget;
  final IconThemeData? iconThemeData;

  const AppBarWidget(
      {super.key,
      required this.title,
      this.actions = const [],
      this.automaticallyImplyLeading = true,
      this.leading,
      this.bottom,
      this.centerTitle = true,
      this.bgColor,
      this.textColor,
      this.titleWidget,
      this.size,
      this.iconThemeData});

  @override
  Size get preferredSize =>
      Size.fromHeight(size ?? (bottom != null ? 120.0 : 60.0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? Theme.of(context).colorScheme.surface,
      elevation: .5,
      bottom: bottom,
      titleSpacing: 10,
      title: titleWidget ??
          Text(title.toString(),
              style: TextStyle(
                  color: textColor ??
                      Palletefy().primaryColor(ThemeModeType.systemMode),
                  fontSize: 18)),
      centerTitle: centerTitle,
      leading: leading,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(0),
        ),
      ),
      iconTheme: iconThemeData ?? IconThemeData(color: HexColor('#000000')),
      actions: actions,
      automaticallyImplyLeading: automaticallyImplyLeading,
    );
  }
}
