// ignore_for_file: deprecated_member_use

import 'package:bloc/bloc.dart';
import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/home/ui/views/home_screen.dart';
import 'package:bulka/modules/navbar_layout/controllers/navbar_layout_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavbarLayoutCubit extends Cubit<NavbarLayoutState> {
  NavbarLayoutCubit() : super(NavbarLayoutInitial());
//---------------------------------VARIABLES----------------------------------//
  int currentIndex = 0;

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        AssetIcons.homeSvg,
        color: AppColors.primary,
      ),
      icon: SvgPicture.asset(
        AssetIcons.homeSvg,
        color: AppColors.mediumGrey5,
      ),
      label: AppStrings.home.tr(),
      tooltip: AppStrings.home.tr(),
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        AssetIcons.postSvg,
        color: AppColors.primary,
      ),
      icon: SvgPicture.asset(
        AssetIcons.postSvg,
        color: AppColors.mediumGrey5,
      ),
      label: AppStrings.posts.tr(),
      tooltip: AppStrings.posts.tr(),
    ),
    // const BottomNavigationBarItem(
    //   activeIcon: Icon(CupertinoIcons.add_circled),
    //   icon: Icon(CupertinoIcons.add_circled),
    //   label: '',
    //   tooltip: '',
    // ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        AssetIcons.messagesSvg,
        color: AppColors.primary,
      ),
      icon: SvgPicture.asset(
        AssetIcons.messagesSvg,
        color: AppColors.mediumGrey5,
      ),
      label: AppStrings.chat.tr(),
      tooltip: AppStrings.chat.tr(),
    ),
    BottomNavigationBarItem(
      activeIcon: SvgPicture.asset(
        AssetIcons.profileeSvg,
        color: AppColors.primary,
      ),
      icon: SvgPicture.asset(
        AssetIcons.profileeSvg,
        color: AppColors.mediumGrey5,
      ),
      label: AppStrings.profile.tr(),
      tooltip: AppStrings.profile.tr(),
    ),
  ];
  List<Widget> navbarScreens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

//---------------------------------FUNCTIONS----------------------------------//
  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeBottomNavState());
  }

//----------------------------------REQUEST-----------------------------------//
}
