
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_cubit.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:social_media_recorder/screen/social_media_recorder.dart';

class ChatFormFieldWidget extends StatelessWidget {
  const ChatFormFieldWidget({super.key});
  static const Color _fillColor = AppColors.darkGrey6;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SpecificChatCubit>();

    return BlocBuilder<SpecificChatCubit, SpecificChatState>(
      buildWhen: (previous, current) => current is UpdateChatFormField,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              DefaultFormField(
                needValidation: false,
                maxLines: -1,
                textInputAction: TextInputAction.done,
                controller: cubit.messageController,
                borderColor: AppColors.transparent,
                onChanged: (value) {
                  cubit.onChangeFormField();
                },
                suffixIcon: cubit.messageController.text.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          final trimmedText =
                              cubit.messageController.text.trim();
                          if (trimmedText != '') {
                            final partialText =
                                types.PartialText(text: trimmedText);
                            cubit.handleSendPressed(partialText);
                          }
                        },
                        icon: const Icon(
                          Icons.send,
                          color: AppColors.white,
                        ),
                      )
                    : null,
                hintText: AppStrings.typeYourMessage.tr(),
                hintStyle: const TextStyle(color: AppColors.white),
                prefixIcon: IconButton(
                  onPressed: () => cubit.handleAttachmentPressed(context),
                  icon: const Icon(
                    CupertinoIcons.cloud_upload,
                    color: AppColors.white,
                  ),
                ),
                fillColor: _fillColor,
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.multiline,
              ),
              if (cubit.messageController.text.isEmpty)
                Align(
                  alignment: Alignment.bottomRight,
                  child: SocialMediaRecorder(
                    radius: BorderRadius.circular(8),
                    backGroundColor: _fillColor,
                    recordIconWhenLockBackGroundColor: AppColors.red,
                    cancelTextBackGroundColor: Colors.transparent,
                    recordIconBackGroundColor: AppColors.primary,
                    counterBackGroundColor: _fillColor,
                    recordIcon: const Icon(
                      Icons.voice_chat,
                      color: AppColors.white,
                    ),

                    startRecording: () {
                      context.read<SpecificChatCubit>().onChangeRecorder(true);
                    },
                    stopRecording: (time) {
                      context.read<SpecificChatCubit>().onChangeRecorder(false);
                    },
                    sendRequestFunction: (soundFile, time) {
                      cubit.handleVoiceMessage(soundFile, time);
                      context.read<SpecificChatCubit>().onChangeRecorder(false);
                    },

                    // encode: AudioEncoderType.AAC,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
