import 'dart:convert';

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/format_date/date_format.dart';
import 'package:bulka/modules/chats/specific_chat/view/screens/specific_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ChatHistoryItemWidget extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final int unread;
  final String? avatarUrl;

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
          color: unread > 0 ? const Color(0xFFF5F7FC) : AppColors.white,
          padding: EdgeInsets.zero,
          child: ListTile(
            onTap: () {
              context.push(SpecificChatScreen());
            },
            leading: avatarUrl == null
                ? CircleAvatar(
                    backgroundColor: AppColors.white,
                    child: SvgPicture.asset(
                      AssetIcons.appIconSvg,
                      height: 18.h,
                      width: 18.w,
                    ),
                  )
                : CircleAvatar(
                    backgroundImage: MemoryImage(base64Decode(avatarUrl!)),
                    radius: 24,
                  ),
            title: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(message),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(DateFormats.timeAgo(DateTime.parse(time).toLocal())),
                if (unread > 0)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      unread.toString(),
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  )
              ],
            ),
          ),
        ),
        const Divider(
          thickness: 1,
          color: AppColors.grey,
          height: .5,
        )
      ],
    );
  }
}
