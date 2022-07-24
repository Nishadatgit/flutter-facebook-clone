import 'package:facebook_clone/components/create_post_section.dart';
import 'package:facebook_clone/components/responsive.dart';
import 'package:facebook_clone/config/color_palette.dart';
import 'package:facebook_clone/data/data.dart';
import 'package:facebook_clone/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../components/contact_list.dart';
import '../components/post_card.dart';
import '../components/rooms_area.dart';
import '../components/stories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Responsive(
          mobile:
              _HomeScreenMobile(scrollController: _trackingScrollController),
          desktop:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  const _HomeScreenMobile({Key? key, required this.scrollController})
      : super(key: key);

  final TrackingScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      slivers: [
        SliverAppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          backgroundColor: Colors.white,
          title: const Text(
            'facebook',
            style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -1.2),
          ),
          floating: true,
          actions: [
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
            )
          ],
        ),
        const SliverToBoxAdapter(
            child: CreatePostSection(
          currentUser: currentUser,
        )),
        const SliverPadding(
          padding: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 5),
          sliver: SliverToBoxAdapter(
            child: RoomsArea(onlineusers: onlineUsers),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(left: 0, top: 5, right: 0, bottom: 5),
          sliver: SliverToBoxAdapter(
            child: Stories(
              stories: stories,
              currentUser: currentUser,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((ctx, index) {
            final Post post = posts[index];
            return PostCard(post: post);
          }, childCount: posts.length),
        )
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  const _HomeScreenDesktop({Key? key, required this.scrollController})
      : super(key: key);

  final TrackingScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Container(
            color: Colors.orange,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 600,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(
                    left: 0, top: 20, right: 0, bottom: 10),
                sliver: SliverToBoxAdapter(
                  child: Stories(
                    stories: stories,
                    currentUser: currentUser,
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: CreatePostSection(
                  currentUser: currentUser,
                ),
              ),
              const SliverPadding(
                padding: EdgeInsets.only(left: 0, top: 10, right: 0, bottom: 5),
                sliver: SliverToBoxAdapter(
                  child: RoomsArea(onlineusers: onlineUsers),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((ctx, index) {
                  final Post post = posts[index];
                  return PostCard(post: post);
                }, childCount: posts.length),
              )
            ],
          ),
        ),
        const Spacer(),
        const Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: ContactList(users: onlineUsers),
            ),
          ),
        )
      ],
    );
  }
}
