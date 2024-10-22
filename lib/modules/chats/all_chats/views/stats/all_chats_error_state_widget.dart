import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_full_screen.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/chats/all_chats/controller/cubit/all_chats_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllChatsErrorStateWidget extends StatelessWidget {
  const AllChatsErrorStateWidget(this.error, {super.key});
  final ApiErrorEntity error;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AllChatsCubit>();

    return cubit.chatHistoryEntity == null
        ? ErrorFullScreen(
            error: error,
            onPressed: () {
              cubit.chatHistoryStatesHandled();
            },
          )
        : ErrorScreen(
            error: error,
            onPressed: () {
              cubit.chatHistoryStatesHandled();
            },
          );
  }
}
