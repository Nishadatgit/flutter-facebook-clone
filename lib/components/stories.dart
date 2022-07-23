import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/components/profile_avatar.dart';
import 'package:facebook_clone/components/responsive.dart';
import 'package:facebook_clone/config/color_palette.dart';
import 'package:facebook_clone/models/story.dart';
import 'package:facebook_clone/models/user_model.dart';
import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key, required this.currentUser, required this.stories})
      : super(key: key);

  final User currentUser;
  final List<Story> stories;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Responsive.isDesktop(context) ? Colors.transparent : Colors.white,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
              child: _StoryCard(
                currentUser: currentUser,
                isAddStory: true,
              ),
            );
          }
          final Story story = stories[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: _StoryCard(
              story: story,
            ),
          );
        },
        itemCount: 1 + stories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  const _StoryCard(
      {Key? key, this.story, this.isAddStory = false, this.currentUser})
      : super(key: key);
  final Story? story;
  final bool isAddStory;
  final User? currentUser;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser!.imageUrl : story!.imageUrl,
            height: double.infinity,
            width: 110,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: Palette.storyGrdient,
              boxShadow: Responsive.isDesktop(context)
                  ? const [
                      BoxShadow(
                          color: Colors.black26,
                          offset: Offset(0, 2),
                          blurRadius: 4)
                    ]
                  : null),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: isAddStory
              ? Container(
                  height: 40,
                  width: 40,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    padding: EdgeInsets.zero,
                    color: Palette.facebookBlue,
                  ),
                )
              : ProfileAvatar(
                  imageurl: story!.user.imageUrl, hasBorder: !story!.isViewed),
        ),
        Positioned(
            bottom: 8,
            left: 8,
            right: 8,
            child: Text(
              isAddStory ? 'Add to story' : story!.user.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
