import 'package:facebook_clone/components/custom_tabbar.dart';
import 'package:facebook_clone/components/user_card.dart';
import 'package:facebook_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/color_palette.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      required this.currentUser,
      required this.icons,
      required this.selectedIndex,
      required this.onTap})
      : super(key: key);
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(color: Colors.black12, offset: Offset(0, 2), blurRadius: 4)
      ]),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Expanded(
          child: Text(
            'facebook',
            style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
        ),
        SizedBox(
          width: 600,
          height: double.infinity,
          child: CustomTabBar(
            icons: icons,
            selectedIndex: selectedIndex,
            onTap: onTap,
            isBottomIndicator:true,
          ),
        ),
        Expanded(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            UserCard(user: currentUser),
            const SizedBox(
              width: 12,
            ),
            Container(
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.grey[200], shape: BoxShape.circle),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
                iconSize: 30,
                color: Colors.black,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                  color: Colors.grey[200], shape: BoxShape.circle),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(MdiIcons.facebookMessenger),
                iconSize: 30,
                color: Colors.black,
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
