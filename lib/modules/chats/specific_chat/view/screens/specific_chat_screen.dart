import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_cubit.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_state.dart';
import 'package:bulka/modules/chats/specific_chat/data/params/get_specific_chat_params.dart';
import 'package:bulka/modules/chats/specific_chat/view/stats/get_specific_chat_error_widget.dart';
import 'package:bulka/modules/chats/specific_chat/view/stats/get_specific_chat_loading_widget.dart';
import 'package:bulka/modules/chats/specific_chat/view/stats/get_specific_chat_success_widget.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/specific_chat_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class SpecificChatScreen extends StatelessWidget {
  const SpecificChatScreen(this.params, {super.key});
  final GetSpecificChatParams params;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SpecificChatCubit(sl())..getSpecificChatStatesHandled(params),
      child: BlocBuilder<SpecificChatCubit, SpecificChatState>(
        buildWhen: (previous, current) =>
            current is GetSpecificChatLoading ||
            current is GetSpecificChatFailure ||
            current is GetSpecificChatSuccess,
        builder: (context, state) {
          return BlocBuilder<SpecificChatCubit, SpecificChatState>(
            builder: (context, state) {
              if (state is GetSpecificChatLoading) {
                return const GetSpecificChatLoadingWidget();
              }
              if (state is GetSpecificChatFailure) {
                return GetSpecificChatErrorWidget(
                  error: state.error,
                  params: params,
                );
              }
              if (context.read<SpecificChatCubit>().checkChatEntityIsInit() ||
                  state is GetSpecificChatSuccess) {
                return const GetSpecificChatSuccessWidget();
              }
              return const Text('no state provided');
            },
          );
        },
      ),
    );
  }
}
