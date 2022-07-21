import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/config/color_palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({Key? key, required this.imageurl, this.isActive = false})
      : super(key: key);
  final String imageurl;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(imageurl),
        ),
        isActive
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Palette.online,
                      border: Border.all(color: Colors.white, width: 2)),
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
