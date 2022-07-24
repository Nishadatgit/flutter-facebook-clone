import 'package:facebook_clone/components/user_card.dart';
import 'package:facebook_clone/models/user_model.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({Key? key, required this.users}) : super(key: key);
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 280),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Contacts',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
              ),
              Icon(
                Icons.search,
                color: Colors.grey[600],
              ),
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.grey[600],
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                final user = users[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: UserCard(user: user),
                );
              },
              itemCount: users.length,
              padding: const EdgeInsets.symmetric(vertical: 10),
            ),
          )
        ],
      ),
    );
  }
}
