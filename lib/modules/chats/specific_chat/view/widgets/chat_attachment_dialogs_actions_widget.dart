import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_cubit.dart';
import 'package:bulka/modules/chats/specific_chat/controllers/specific/specific_chat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ChatAttachmentDialogsActionsWidget extends StatelessWidget {
  const ChatAttachmentDialogsActionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpecificChatCubit, SpecificChatState>(
      buildWhen: (previous, current) => current is ToggleAttachmentActions,
      builder: (context, state) {
        return context.read<SpecificChatCubit>().showAttachment
            ? SizedBox(
                height: 240,
                child: Card(
                  elevation: 1,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Color(0xFFEEEEEE)),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: Colors.white,
                  margin: const EdgeInsets.all(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: itemAction(
                                onPressed: () {},
                                svgPicturePath: AssetIcons.imageSvg,
                                title: 'Photo',
                              ),
                            ),
                            Expanded(
                              child: itemAction(
                                onPressed: () {},
                                svgPicturePath: AssetIcons.videoSquare,
                                title: 'Video',
                              ),
                            ),
                            Expanded(
                              child: itemAction(
                                onPressed: () {},
                                svgPicturePath: AssetIcons.locationSvg,
                                title: 'Location',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: itemAction(
                                onPressed: () {},
                                svgPicturePath: AssetIcons.profileeSvg,
                                title: 'Contact',
                              ),
                            ),
                            Expanded(
                              child: itemAction(
                                onPressed: () {},
                                svgPicturePath: AssetIcons.documentSvg,
                                title: 'Document',
                              ),
                            ),
                            Expanded(
                              child: itemAction(
                                onPressed: () {},
                                svgPicturePath: AssetIcons.headphoneSvg,
                                title: 'Voice Note',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ).animate().move(begin: const Offset(0, 150))
            : const SizedBox();
      },
    );
  }

  Widget itemAction({
    Widget? child,
    String? svgPicturePath,
    void Function()? onPressed,
    String? title,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFD3B100),
          radius: 25,
          child: IconButton(
            onPressed: onPressed ?? () {},
            icon: child ??
                SvgPicture.asset(
                  svgPicturePath ?? AssetIcons.imageSvg,
                  height: 21,
                  width: 21,
                  // ignore: deprecated_member_use
                  color: AppColors.white,
                ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title ?? "",
          style: const TextStyle(
            color: Color(0xFF313131),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
