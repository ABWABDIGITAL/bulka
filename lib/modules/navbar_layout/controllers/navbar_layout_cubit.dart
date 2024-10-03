// ignore_for_file: deprecated_member_use

import 'package:bloc/bloc.dart';
import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/chats/specific_chat/data/params/get_specific_chat_params.dart';
import 'package:bulka/modules/chats/specific_chat/view/screens/specific_chat_screen.dart';
import 'package:bulka/modules/home/ui/views/home_screen.dart';
import 'package:bulka/modules/home/ui/widgets/home_appbar_widget.dart';
import 'package:bulka/modules/navbar_layout/controllers/navbar_layout_state.dart';
import 'package:bulka/modules/posts_module/posts/ui/views/posts_screen.dart';
import 'package:bulka/modules/profile/ui/views/profile_screen.dart';
import 'package:bulka/modules/profile/ui/widgets/profile_appbar_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NavbarLayoutCubit extends Cubit<NavbarLayoutState> {
  NavbarLayoutCubit() : super(NavbarLayoutInitial());
//---------------------------------VARIABLES----------------------------------//
  int currentIndex = 0;
  final bottomPad = 6.r;

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      activeIcon: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 8.r),
        child: SvgPicture.asset(
          AssetIcons.homeSvg,
          color: AppColors.primary,
          height: 20.h,
          width: 20.w,
        ),
      ),
      icon: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 8.r),
        child: SvgPicture.asset(
          AssetIcons.homeSvg,
          color: AppColors.mediumGrey5,
          height: 20.h,
          width: 20.w,
        ),
      ),
      label: AppStrings.home.tr(),
      tooltip: AppStrings.home.tr(),
    ),
    BottomNavigationBarItem(
      activeIcon: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 8.r),
        child: SvgPicture.asset(
          AssetIcons.postSvg,
          color: AppColors.primary,
          height: 20.h,
          width: 20.w,
        ),
      ),
      icon: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 8.r),
        child: SvgPicture.asset(
          AssetIcons.postSvg,
          color: AppColors.mediumGrey5,
          height: 20.h,
          width: 20.w,
        ),
      ),
      label: AppStrings.posts.tr(),
      tooltip: AppStrings.posts.tr(),
    ),
    BottomNavigationBarItem(
      activeIcon: FloatingActionButton(
        onPressed: () {},
        mini: true,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(300.r)),
        backgroundColor: AppColors.primary.withOpacity(.3),
        child: const Icon(
          CupertinoIcons.add,
          color: AppColors.primary2,
        ),
      ),
      icon: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.primary.withOpacity(.3),
        mini: true,
        elevation: 0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(300.r)),
        child: const Icon(
          CupertinoIcons.add,
          color: AppColors.primary2,
        ),
      ),
      label: '',
      tooltip: '',
    ),
    BottomNavigationBarItem(
      activeIcon: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 8.r),
        child: SvgPicture.asset(
          AssetIcons.messagesSvg,
          color: AppColors.primary,
          height: 20.h,
          width: 20.w,
        ),
      ),
      icon: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 8.r),
        child: SvgPicture.asset(
          AssetIcons.messagesSvg,
          color: AppColors.mediumGrey5,
          height: 20.h,
          width: 20.w,
        ),
      ),
      label: AppStrings.chat.tr(),
      tooltip: AppStrings.chat.tr(),
    ),
    BottomNavigationBarItem(
      activeIcon: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 8.r),
        child: SvgPicture.asset(
          AssetIcons.profileeSvg,
          color: AppColors.primary,
          height: 20.h,
          width: 20.w,
        ),
      ),
      icon: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 8.r),
        child: SvgPicture.asset(
          AssetIcons.profileeSvg,
          color: AppColors.mediumGrey5,
          height: 20.h,
          width: 20.w,
        ),
      ),
      label: AppStrings.profile.tr(),
      tooltip: AppStrings.profile.tr(),
    ),
  ];
  List<Widget> navbarScreens = [
    const HomeScreen(),
    const PostsScreen(),
    const HomeScreen(),
    const SpecificChatScreen(GetSpecificChatParams(chatId: "1")),
    const ProfileScreen(),
  ];

  List<PreferredSizeWidget> navAppbars = [
    const HomeAppbarWidget(),
    const HomeAppbarWidget(),
    const HomeAppbarWidget(),
    const PreferredSize(
        preferredSize: Size.fromHeight(0), child: HomeAppbarWidget()),
    const ProfileAppbarWidget(),
  ];

//---------------------------------FUNCTIONS----------------------------------//
  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeBottomNavState());
  }

//----------------------------------REQUEST-----------------------------------//
}
