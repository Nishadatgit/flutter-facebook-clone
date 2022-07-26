import 'package:facebook_clone/config/color_palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar(
      {Key? key,
      required this.icons,
      required this.selectedIndex,
      required this.onTap,
      this.isBottomIndicator = false})
      : super(key: key);

  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        onTap: onTap,
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(
            border: isBottomIndicator
                ? const Border(
                    bottom: BorderSide(color: Palette.facebookBlue, width: 3),
                  )
                : const Border(
                    top: BorderSide(color: Palette.facebookBlue, width: 3),
                  )),
        tabs: icons
            .asMap()
            .map(
              (i, e) => MapEntry(
                i,
                Tab(
                  icon: Icon(
                    e,
                    color: i == selectedIndex
                        ? Palette.facebookBlue
                        : Colors.black45,
                    size: 30,
                  ),
                ),
              ),
            )
            .values
            .toList());
  }
}
