import 'dart:convert';

import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_state.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/badge_icon_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/notifications/views/screens/notifications_screen.dart';
import 'package:bulka/modules/search/views/screens/search_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class HomeAppbarWidget extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppbarWidget({super.key, this.height});
  final double? height;

  @override
  State<HomeAppbarWidget> createState() => _HomeAppbarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(height ?? 165.h);
}

class _HomeAppbarWidgetState extends State<HomeAppbarWidget> {
  @override
  void initState() {
    super.initState();
    context.read<MyProfileInfoCubit>().profileStatesHandled();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyProfileInfoCubit, MyProfileInfoState>(
      buildWhen: (previous, current) =>
          current is MyProfileInfoLoading ||
          current is MyProfileInfoSuccess ||
          current is MyProfileInfoError,
      builder: (context, state) {
        final cubit = context.read<MyProfileInfoCubit>();
        return CustomAppBarWidget(
          height: widget.height ?? 195.h,
          backgroundColor: AppColors.opactiyPrimary,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.opactiyPrimary,
            statusBarIconBrightness: Brightness.dark,
          ),
          leading: const SizedBox(),
          leadingWidth: 0,
          flexibleSpace: SafeArea(
            child: Column(
              children: [
                ListTile(
                  leading: cubit.profileEntity == null ||
                          cubit.profileEntity?.avatar == null
                      ? CircleAvatar(
                          backgroundColor: AppColors.white,
                          child: SvgPicture.asset(
                            AssetIcons.appIconSvg,
                            height: 18.h,
                            width: 18.w,
                            // placeholderBuilder: (context) =>
                            //     const CircularProgressIndicator(),
                          ),
                        )
                      : CircleAvatar(
                          backgroundImage: MemoryImage(
                            base64Decode(cubit.profileEntity!.avatar!),
                          ),
                        ),
                  title: Text(
                    'Welcome ,${cubit.profileEntity?.fullName} 👋',
                    style: TextStyles.rubik14W500LigtBlack,
                  ),
                  subtitle: Text(
                    'Worry from free deals',
                    style: TextStyles.rubik12W400DarkGrey4,
                  ),
                  trailing: InkWell(
                    borderRadius: BorderRadius.circular(500),
                    onTap: () {
                      context.push(const NotificationsScreen());
                    },
                    child: const CircleAvatar(
                      backgroundColor: AppColors.white,
                      radius: 22,
                      child: BadgeIconWidget(),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(18.r),
                  child: GestureDetector(
                    onTap: () {
                      context.push(const SearchScreen());
                    },
                    child: DefaultFormField(
                      needValidation: false,
                      enabled: false,
                      borderColor: AppColors.white,
                      borderRadious: 12.r,
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetIcons.searchSvg,
                            height: 18.h,
                            width: 18.w,
                          ),
                        ],
                      ),
                      hintText: AppStrings.seachAboutSomeThingHere.tr(),
                      suffixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            AssetIcons.filterSvg,
                            height: 18.h,
                            width: 18.w,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
