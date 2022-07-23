import 'package:facebook_clone/components/profile_avatar.dart';
import 'package:facebook_clone/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageurl: user.imageUrl),
          const SizedBox(
            width: 6,
          ),
          Text(
            user.name,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    );
  }
}
