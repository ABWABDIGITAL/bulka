import 'dart:math';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_client_entity.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_message_entity.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_cubit.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_state.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_attachment_dialogs_actions_widget.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_bubble_display_item_widget.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_date_chip_time_widget.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_form_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpecificChatScreen extends StatefulWidget {
  const SpecificChatScreen({super.key});

  @override
  _SpecificChatScreenState createState() => _SpecificChatScreenState();
}

class _SpecificChatScreenState extends State<SpecificChatScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SpecificChatCubit(sl())..initMessages(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chat Example'),
        ),
        body: BlocBuilder<SpecificChatCubit, SpecificChatState>(
          builder: (context, state) {
            final cubit = context.read<SpecificChatCubit>();
            return GestureDetector(
              onTap: () {
                cubit.toggleAttachment(showAttachment: false);
              },
              child: Column(
                children: [
                  Expanded(
                    child: Stack(
                      children: [
                        ListView.builder(
                          reverse: true,
                          itemCount: cubit.messages.length,
                          itemBuilder: (context, index) {
                            final message = cubit.messages[index];
                            return Column(
                              children: [
                                if (index == 0 ||
                                    cubit.messages[index - 1].createdAt !=
                                        message.createdAt)
                                  ChatDateChipTimeWidget(cubit.messages[index]),
                                ChatBubbleDisplayItemWidget(message),
                              ],
                            );
                          },
                        ),
                        const Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: ChatAttachmentDialogsActionsWidget(),
                        ),
                      ],
                    ),
                  ),
                  ChatFormFieldWidget(
                    onSend: (text) {
                      if (text.isNotEmpty) {}
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}


// import 'package:bulka/core/services/servies_locator/service_locator.dart';
// import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_cubit.dart';
// import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_state.dart';
// import 'package:bulka/modules/chats/specific_chat/data/params/get_specific_chat_params.dart';
// import 'package:bulka/modules/chats/specific_chat/view/stats/get_specific_chat_error_widget.dart';
// import 'package:bulka/modules/chats/specific_chat/view/stats/get_specific_chat_loading_widget.dart';
// import 'package:bulka/modules/chats/specific_chat/view/stats/get_specific_chat_success_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class SpecificSpecificSpecificChatScreen extends StatelessWidget {
//   const SpecificSpecificSpecificChatScreen(this.params, {super.key});
//   final GetSpecificChatParams params;
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) =>
//           SpecificChatCubit(sl())..getSpecificChatStatesHandled(params),
//       child: BlocBuilder<SpecificChatCubit, SpecificChatState>(
//         buildWhen: (previous, current) =>
//             current is GetSpecificChatLoading ||
//             current is GetSpecificChatFailure ||
//             current is GetSpecificChatSuccess,
//         builder: (context, state) {
//           return BlocBuilder<SpecificChatCubit, SpecificChatState>(
//             builder: (context, state) {
//               if (state is GetSpecificChatLoading) {
//                 return const GetSpecificChatLoadingWidget();
//               }
//               if (state is GetSpecificChatFailure) {
//                 return GetSpecificChatErrorWidget(
//                   error: state.error,
//                   params: params,
//                 );
//               }
//               if (context.read<SpecificChatCubit>().checkChatEntityIsInit() ||
//                   state is GetSpecificChatSuccess) {
//                 return const GetSpecificChatSuccessWidget();
//               }
//               return const Text('no state provided');
//             },
//           );
//         },
//       ),
//     );
//   }
// }
