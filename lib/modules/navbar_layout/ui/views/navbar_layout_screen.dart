import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/create_ad/views/screens/choose_ad_type_dialog_widget.dart';
import 'package:bulka/modules/navbar_layout/controllers/navbar_layout_cubit.dart';
import 'package:bulka/modules/navbar_layout/controllers/navbar_layout_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavbarLayoutScreen extends StatelessWidget {
  const NavbarLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarLayoutCubit(),
      child: BlocBuilder<NavbarLayoutCubit, NavbarLayoutState>(
        buildWhen: (previous, current) => current is HomeBottomNavState,
        builder: (context, state) {
          final cubit = context.read<NavbarLayoutCubit>();
          return Scaffold(
            appBar: cubit.navAppbars[cubit.currentIndex],
            bottomNavigationBar: SizedBox(
              height: 90.h,
              child: BottomNavigationBar(
                selectedLabelStyle:
                    TextStyles.rubik10W400Primary.copyWith(fontSize: 12.sp),
                unselectedLabelStyle: TextStyles.rubik10W400Primary
                    .copyWith(color: AppColors.mediumGrey5),
                backgroundColor: AppColors.white,
                elevation: 1,
                showUnselectedLabels: true,
                items: [
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
                      onPressed: () {
                        chooseAdTypeDialogWidget(context);
                      },
                      mini: true,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(300.r)),
                      backgroundColor: AppColors.primary.withOpacity(.3),
                      child: const Icon(
                        CupertinoIcons.add,
                        color: AppColors.primary2,
                      ),
                    ),
                    icon: FloatingActionButton(
                      onPressed: () {
                        chooseAdTypeDialogWidget(context);
                      },
                      backgroundColor: AppColors.primary.withOpacity(.3),
                      mini: true,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(300.r)),
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
                ],
                showSelectedLabels: true,
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.mediumGrey5,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                type: BottomNavigationBarType.fixed,
              ),
            ),
            body: cubit.navbarScreens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
