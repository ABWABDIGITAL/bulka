import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';

class ChatHistoryItemWidget extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final bool unread;
  final String avatarUrl;

  const ChatHistoryItemWidget({
    super.key,
    required this.name,
    required this.message,
    required this.time,
    required this.unread,
    required this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: unread ? const Color(0xFFF5F7FC) : AppColors.white,
          padding: EdgeInsets.zero,
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(avatarUrl),
              radius: 24,
            ),
            title: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(message),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(time),
                if (unread)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )
              ],
            ),
          ),
        ),
        const Divider()
      ],
    );
  }
}
