import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_cubit.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_state.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_form_field_widget.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/specific_chat_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:voice_message_package/voice_message_package.dart';

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
            onPreviewDataFetched:
                context.read<SpecificChatCubit>().handlePreviewDataFetched,
            imageGalleryOptions: const ImageGalleryOptions(),
            usePreviewData: true,
            textMessageOptions: const TextMessageOptions(
              openOnPreviewImageTap: true,
              openOnPreviewTitleTap: true,
              isTextSelectable: true,
            ),
            inputOptions: InputOptions(
              sendButtonVisibilityMode: SendButtonVisibilityMode.always,
              textEditingController:
                  context.read<SpecificChatCubit>().messageController,
              // onTextChanged: (value) =>
              //     context.read<SpecificChatCubit>().updateUi(),
            ),
            onMessageTap: context.read<SpecificChatCubit>().handleMessageTap,
            onAttachmentPressed: () => context
                .read<SpecificChatCubit>()
                .handleAttachmentPressed(context),
            audioMessageBuilder: (audioMessage, {required messageWidth}) {
              return VoiceMessageView(
                backgroundColor: AppColors.primary,
                controller: VoiceController(
                  audioSrc: audioMessage.uri,
                  maxDuration: audioMessage.duration,
                  onComplete: () {},
                  onPause: () {},
                  onPlaying: () {},
                  isFile: false,
                ),
              );
            },
            customBottomWidget: const ChatFormFieldWidget(),
            theme: DefaultChatTheme(
              // sendButtonIcon: context
              //         .read<SpecificChatCubit>()
              //         .messageController
              //         .text
              //         .isEmpty
              //     ? IconButton(onPressed: () {}, icon: Icon(Icons.voice_chat))
              //     : null,
              //  Align(
              //   alignment: Alignment.bottomRight,
              //   child: SocialMediaRecorder(
              //     sendRequestFunction: (file) {},
              //     backGroundColor: AppColors.primary,
              //   ),
              // ),
              // sendingIcon: SocialMediaRecorder(
              //   sendRequestFunction: (file) {},
              // ),
              // INPUT TEXTFIELD THEME

              inputTextCursorColor: Colors.red,
              inputSurfaceTintColor: Colors.yellow,
              inputBackgroundColor: Colors.white,
              inputTextColor: Colors.white,
              inputMargin:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              inputTextStyle: const TextStyle(
                color: Colors.black,
              ),
              inputBorderRadius: const BorderRadius.horizontal(
                left: Radius.circular(10),
                right: Radius.circular(10),
              ),
              // inputTextDecoration: const InputDecoration(
              //   border: InputBorder.none,
              //   contentPadding: EdgeInsets.zero,
              //   hintText: 'Type a message',
              //   hintStyle: TextStyle(color: Colors.black54),
              // ),
              inputContainerDecoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(10),
                  right: Radius.circular(10),
                ),
              ),
              primaryColor: const Color.fromARGB(255, 191, 12, 12),
              backgroundColor: const Color.fromARGB(255, 227, 227, 227),
            ),
          ),
        );
      },
    );
  }

  Widget inp(BuildContext context) {
    return Input(
      options: InputOptions(
        sendButtonVisibilityMode: SendButtonVisibilityMode.always,
        textEditingController:
            context.read<SpecificChatCubit>().messageController,
        // onTextChanged: (value) => context.read<SpecificChatCubit>().updateUi(),
      ),
      onSendPressed: (partialText) {
        context.read<SpecificChatCubit>().handleSendPressed(partialText);
      },
      onAttachmentPressed: () =>
          context.read<SpecificChatCubit>().handleAttachmentPressed(context),
    );
  }
}
// context.read<SpecificChatCubit>().messageController.text.isEmpty
//                     ? Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           if (!context.read<SpecificChatCubit>().isRec)
//                             Expanded(
//                               child: inp(context),
//                             ),
                          // Align(
                          //   alignment: Alignment.bottomRight,
                          //   child: SocialMediaRecorder(
                          //     backGroundColor: Colors.transparent,
                          //     cancelTextBackGroundColor: Colors.transparent,
                          //     recordIconBackGroundColor: AppColors.primary,
                          //     startRecording: () {
                          //       context
                          //           .read<SpecificChatCubit>()
                          //           .onChangeRecorder(true);
                          //     },
                          //     stopRecording: (time) {
                          //       context
                          //           .read<SpecificChatCubit>()
                          //           .onChangeRecorder(false);
                          //     },
                          //     sendRequestFunction: (soundFile, time) {
                          //       context
                          //           .read<SpecificChatCubit>()
                          //           .onChangeRecorder(false);
                          //       // context.read<SpecificChatCubit>().uploadAudiotoStorage(context, soundFile.path);
                          //     },
                          //     encode: AudioEncoderType.AAC,
                          //   ),
                          // ),
//                         ],
//                       )
//                     : inp(context)