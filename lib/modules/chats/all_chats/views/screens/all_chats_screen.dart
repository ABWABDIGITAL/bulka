import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/chats/all_chats/controller/cubit/all_chats_cubit.dart';
import 'package:bulka/modules/chats/all_chats/controller/cubit/all_chats_state.dart';
import 'package:bulka/modules/chats/all_chats/views/stats/all_chats_error_state_widget.dart';
import 'package:bulka/modules/chats/all_chats/views/stats/all_chats_loading_state_widget.dart';
import 'package:bulka/modules/chats/all_chats/views/stats/all_chats_success_state_widget.dart';
import 'package:bulka/modules/chats/all_chats/views/widgets/chat_history_item_widget.dart';
import 'package:bulka/modules/chats/all_chats/views/widgets/filter_history_chip_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllChatsScreen extends StatefulWidget {
  const AllChatsScreen({super.key});

  @override
  State<AllChatsScreen> createState() => _AllChatsScreenState();
}

class _AllChatsScreenState extends State<AllChatsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllChatsCubit(sl())..chatHistoryStatesHandled(),
      child: Scaffold(
        appBar: CustomAppBarWidget(
          height: 100,
          backgroundColor: AppColors.lightPrimary,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.lightPrimary,
            statusBarIconBrightness: Brightness.light,
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: [
              Tab(text: AppStrings.all.tr()),
              Tab(text: AppStrings.buying.tr()),
              Tab(text: AppStrings.selling.tr()),
            ],
            indicatorColor: AppColors.yellow,
            indicatorSize: TabBarIndicatorSize.tab,
            dividerHeight: 2,
            dividerColor: const Color(0xFFD4D4D4),
            unselectedLabelColor: AppColors.white,
            labelColor: AppColors.yellow,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<AllChatsCubit, AllChatsState>(
          buildWhen: (previous, current) =>
              current is AllChatsLoading ||
              current is AllChatsSuccess ||
              current is AllChatsError,
          builder: (context, state) {
            final cubit = context.read<AllChatsCubit>();

            if (state is AllChatsLoading) {
              return const AllChatsLoadingStateWidget();
            }
            if (cubit.chatHistoryEntity != null || state is AllChatsSuccess) {
              return const AllChatsSuccessStateWidget();
            }
            if (state is AllChatsError) {
              return AllChatsErrorStateWidget(state.error);
            }
            return const Text('no state provided');
          },
        ),
      ),
    );
  }
}
