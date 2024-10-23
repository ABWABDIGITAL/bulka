import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_cubit.dart';
import 'package:bulka/modules/chats/specific_chat/data/params/get_specific_chat_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class GetSpecificChatErrorWidget extends StatelessWidget {
//   const GetSpecificChatErrorWidget({
//     super.key,
//     required this.error,
//     required this.params,
//   });
//   final ApiErrorEntity error;
//   final GetSpecificChatParams params;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ErrorScreen(
//       error: error,
//       onPressed: () {
//         context.read<SpecificChatCubit>().getSpecificChatStatesHandled(params);
//       },
//     ));
//   }
// }
