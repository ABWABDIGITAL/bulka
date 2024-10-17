import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/chats/all_chats/views/widgets/chat_history_item_widget.dart';
import 'package:bulka/modules/chats/all_chats/views/widgets/filter_history_chip_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return Scaffold(
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
      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FilterHistoryChipWidget(
                  avatar: SvgPicture.asset(AssetIcons.startInCircleSvg),
                  label: AppStrings.all.tr(),
                ),
                FilterHistoryChipWidget(
                  avatar: SvgPicture.asset(
                    AssetIcons.startInCircleSvg,
                    color: AppColors.yellow,
                  ),
                  label: AppStrings.important.tr(),
                ),
                FilterHistoryChipWidget(
                  avatar: SvgPicture.asset(
                    AssetIcons.startInCircleSvg,
                    color: AppColors.orange,
                  ),
                  label: AppStrings.unreadChat.tr(),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1, color: AppColors.grey),
          Expanded(
            child: ListView(
              children: const [
                ChatHistoryItemWidget(
                  name: 'Abdullah Ezz',
                  message: '78,000 \$?',
                  time: '12:21',
                  unread: true,
                  avatarUrl: 'https://via.placeholder.com/150',
                ),
                ChatHistoryItemWidget(
                  name: 'Amr Bn Zayed',
                  message: 'What About 75,000 L.E?',
                  time: '11:21',
                  unread: false,
                  avatarUrl: 'https://via.placeholder.com/150',
                ),
                ChatHistoryItemWidget(
                  name: 'Ahmed Omar',
                  message: 'Still Available?',
                  time: '12:21',
                  unread: false,
                  avatarUrl: 'https://via.placeholder.com/150',
                ),
                ChatHistoryItemWidget(
                  name: 'Mohamed Khtab',
                  message: 'Tomorrow between 8:10',
                  time: '12:21',
                  unread: false,
                  avatarUrl: 'https://via.placeholder.com/150',
                ),
                ChatHistoryItemWidget(
                  name: 'Anas Ibrahim',
                  message: '20,000 \$?',
                  time: '12:21',
                  unread: false,
                  avatarUrl: 'https://via.placeholder.com/150',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
