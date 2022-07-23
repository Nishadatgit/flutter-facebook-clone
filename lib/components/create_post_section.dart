import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_clone/components/responsive.dart';
import 'package:facebook_clone/models/user_model.dart';
import 'package:flutter/material.dart';

class CreatePostSection extends StatelessWidget {
  const CreatePostSection({Key? key, required this.currentUser})
      : super(key: key);
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: Responsive.isDesktop(context) ? 1 : 0,
      shape: Responsive.isDesktop(context)
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          : null,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: Responsive.isDesktop(context) ? 5 : 0),
        padding: const EdgeInsets.only(left: 12, right: 12, bottom: 0, top: 8),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 20,
                  backgroundImage:
                      CachedNetworkImageProvider(currentUser.imageUrl),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                        hintText: "What's on your head"),
                  ),
                )
              ],
            ),
            const Divider(
              height: 10,
              thickness: 0.5,
            ),
            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.videocam,
                      color: Colors.red,
                    ),
                    label: const Text(
                      'Live',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.photo_library,
                      color: Colors.green,
                    ),
                    label: const Text(
                      'Photo',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  const VerticalDivider(
                    width: 8.0,
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.video_call,
                      color: Colors.purpleAccent,
                    ),
                    label: const Text(
                      'Room',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
