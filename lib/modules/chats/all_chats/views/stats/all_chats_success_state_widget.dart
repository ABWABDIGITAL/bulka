// ignore_for_file: deprecated_member_use

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/chats/all_chats/controller/cubit/all_chats_cubit.dart';
import 'package:bulka/modules/chats/all_chats/controller/cubit/all_chats_state.dart';
import 'package:bulka/modules/chats/all_chats/views/widgets/chat_history_item_widget.dart';
import 'package:bulka/modules/chats/all_chats/views/widgets/filter_history_chip_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class AllChatsSuccessStateWidget extends StatelessWidget {
  const AllChatsSuccessStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllChatsCubit, AllChatsState>(
      buildWhen: (previous, current) => current is AllChatsSuccess,
      builder: (context, state) {
        final cubit = context.read<AllChatsCubit>();

        return Column(
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FilterHistoryChipWidget(
                    avatar: SvgPicture.asset(AssetIcons.startInCircleSvg),
                    label: AppStrings.all.tr(),
                    isSelected: cubit.keyWords == ChatHistoryKeywords.all
                        ? true
                        : false,
                  ),
                  FilterHistoryChipWidget(
                    avatar: SvgPicture.asset(
                      AssetIcons.startInCircleSvg,
                      color: AppColors.yellow,
                    ),
                    label: AppStrings.important.tr(),
                    isSelected: cubit.keyWords == ChatHistoryKeywords.important
                        ? true
                        : false,
                  ),
                  FilterHistoryChipWidget(
                    avatar: SvgPicture.asset(
                      AssetIcons.startInCircleSvg,
                      color: AppColors.orange,
                    ),
                    label: AppStrings.unreadChat.tr(),
                    isSelected: cubit.keyWords == ChatHistoryKeywords.unread
                        ? true
                        : false,
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 1,
              color: AppColors.grey,
              height: .5,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final chat = cubit.chatHistoryEntity!.data[index];
                  return ChatHistoryItemWidget(
                    name: chat.otherSideInChatEntity.name,
                    message: chat.lastMessage,
                    time: chat.lastMessageTime,
                    unread: chat.unreadMessagesCount,
                    avatarUrl: chat.otherSideInChatEntity.avatar,
                  );
                },
                itemCount: cubit.chatHistoryEntity!.data.length,
              ),
            ),
          ],
        );
      },
    );
  }
}
