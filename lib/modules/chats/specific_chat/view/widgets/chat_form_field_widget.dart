import 'dart:math';

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_client_entity.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_message_entity.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_cubit.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatFormFieldWidget extends StatelessWidget {
  const ChatFormFieldWidget({super.key, this.onSend});
  final Function(String)? onSend;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SpecificChatCubit>();

    return BlocBuilder<SpecificChatCubit, SpecificChatState>(
      buildWhen: (previous, current) => current is UpdateChatFormField,
      builder: (context, state) {
        return Column(
          children: [
            // ListTile(
            //   // leading: Image.file(
            //   //   cubit.diplayImage!,
            //   //   height: 40.h,
            //   //   width: 40.w,
            //   // ),
            //   // title: cubit.fileSize == null
            //   //     ? null
            //   //     : Text(
            //   //         _formatBytes(cubit.fileSize!),
            //   //         style: TextStyles.mulish12W400Black,
            //   //       ),
            //   trailing: IconButton(
            //     icon: const Icon(
            //       Icons.close,
            //       color: AppColors.red,
            //     ),
            //     onPressed: () {
            //       // cubit.clearPickedImage();
            //     },
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: DefaultFormField(
                      controller: cubit.messageController,
                      keyboardType: TextInputType.multiline,
                      maxLines: 6,
                      minLines: 1,
                      borderColor: const Color(0xFFEEEEEE),
                      hintText: 'Send Message'.tr(),
                      suffixIcon: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              cubit.toggleAttachment();
                            },
                            icon: SvgPicture.asset(
                              AssetIcons.linkSvg,
                              height: 21,
                              width: 21,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              AssetIcons.cameraSvg,
                              height: 21,
                              width: 21,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  CircleAvatar(
                    backgroundColor: const Color(0xFF5279FF),
                    child: IconButton(
                      icon: SvgPicture.asset(
                        AssetIcons.sendSvg,
                        height: 21,
                        width: 21,
                      ),
                      onPressed: () {
                        onSend?.call(cubit.messageController.text);
                        if (cubit.messageController.text.isEmpty) return;
                        cubit.addMessage(
                          ChatMessageEntity(
                            message: cubit.messageController.text,
                            createdAt: DateTime.now().toString(),
                            readAt: DateTime.now().toString(),
                            messageOwner: ChatClientEntity(
                              id: Random().nextInt(1512546),
                              name: 'Client Name',
                              role: ChatClientSideRole.mySide,
                              avatar:
                                  'https://plus.unsplash.com/premium_photo-1725873534652-b5b500b0a951?q=80&w=1769&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                            ),
                            isRead: true,
                            type: ChatMessageTypes.text,
                            id: Random().nextInt(15554),
                          ),
                        );
                        cubit.messageController.clear();
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
