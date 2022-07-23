import 'package:facebook_clone/components/responsive.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../components/custom_appar.dart';
import '../components/custom_tabbar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  static const List<Widget> _screens = [
    HomeScreen(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold()
  ];
  static const List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
        appBar: Responsive.isDesktop(context)
            ? PreferredSize(
                preferredSize: Size(screenSize.width, 100),
                child:CustomAppBar(
                  currentUser:currentUser,
                  icons:_icons,
                  selectedIndex:_selectedIndex,
                   onTap: (int index) => setState(() => _selectedIndex = index),
                )
              )
            : null,
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: !Responsive.isDesktop(context)
            ? Container(
                color: Colors.white,
                padding: const EdgeInsets.only(bottom: 12),
                child: CustomTabBar(
                  icons: _icons,
                  selectedIndex: _selectedIndex,
                  onTap: (int index) => setState(() => _selectedIndex = index),
                ),
              )
            : const SizedBox.shrink(),
      ),
    );
  }
}
