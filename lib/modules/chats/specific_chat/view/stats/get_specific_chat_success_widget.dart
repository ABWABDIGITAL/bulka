import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_cubit.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_state.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/specific_chat_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class GetSpecificChatSuccessWidget extends StatelessWidget {
  const GetSpecificChatSuccessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecificChatCubit, SpecificChatState>(
      buildWhen: (previous, current) => current is UpdateChatUi,
      builder: (context, state) {
        return Scaffold(
          appBar: const SpecificChatAppbar(),
          body: Chat(
            messages: context.read<SpecificChatCubit>().messages,
            user: context.read<SpecificChatCubit>().user,
            onSendPressed: (partialText) {
              context.read<SpecificChatCubit>().handleSendPressed(partialText);
            },
            showUserNames: true,
            showUserAvatars: true,
            imageGalleryOptions: const ImageGalleryOptions(),
            usePreviewData: true,
            textMessageOptions: const TextMessageOptions(
              openOnPreviewImageTap: true,
              openOnPreviewTitleTap: true,
              isTextSelectable: true,
            ),
            inputOptions: const InputOptions(
              sendButtonVisibilityMode: SendButtonVisibilityMode.always,
            ),
            onMessageTap: context.read<SpecificChatCubit>().handleMessageTap,
            onAttachmentPressed: () => context
                .read<SpecificChatCubit>()
                .handleAttachmentPressed(context),
            theme: DefaultChatTheme(
              inputMargin: const EdgeInsets.all(8),
              inputElevation: 2,
              inputBorderRadius: BorderRadius.circular(20),
              inputBackgroundColor: Colors.white,
              inputTextColor: Colors.black,
              primaryColor: AppColors.primary,
              secondaryColor: Colors.grey.shade200,
              sendingIcon: const Icon(
                Icons.send_rounded,
                color: AppColors.primary,
              ),
              sendButtonIcon: const Icon(
                Icons.send_rounded,
                color: AppColors.primary,
              ),
            ),
          ),
        );
      },
    );
  }
}
