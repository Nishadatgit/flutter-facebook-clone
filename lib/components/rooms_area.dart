import 'package:facebook_clone/components/profile_avatar.dart';
import 'package:facebook_clone/components/responsive.dart';
import 'package:facebook_clone/config/color_palette.dart';
import 'package:facebook_clone/models/user_model.dart';
import 'package:flutter/material.dart';

class RoomsArea extends StatelessWidget {
  const RoomsArea({Key? key, required this.onlineusers}) : super(key: key);
  final List<User> onlineusers;

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
        height: 60,
        color: Colors.white,
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    textStyle: const TextStyle(color: Palette.facebookBlue),
                    side: BorderSide(width: 3, color: Colors.blueAccent[100]!),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    primary: Colors.white,
                  ),
                  child: Row(
                    children: [
                      ShaderMask(
                        shaderCallback: (rect) =>
                            Palette.createRoomGradient.createShader(rect),
                        child: const Icon(
                          Icons.video_call,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      const Text(
                        'Create \nRoom',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            }
            final User user = onlineusers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ProfileAvatar(
                imageurl: user.imageUrl,
                isActive: true,
              ),
            );
          },
          itemCount: onlineusers.length + 1,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        ),
      ),
    );
  }
}
