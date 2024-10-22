import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/settings/controller/settings_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SettingsNotifiactionsListTile extends StatelessWidget {
  const SettingsNotifiactionsListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();
    final profileCubit = context.read<MyProfileInfoCubit>();
    return BlocConsumer<SettingsCubit, SettingsState>(
      listenWhen: (previous, current) =>
          current is SettingsNotificationToggleFailure ||
          current is SettingsNotificationToggleSuccess ||
          current is SettingsNotificationToggleLoading||
          current is SettingsNotificationChanged,
      listener: (context, state) {
        if (state is SettingsNotificationToggleSuccess) {
          profileCubit.profileStatesHandled();
        } else if (state is SettingsNotificationToggleFailure) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
      },
      buildWhen: (previous, current) =>
          current is SettingsNotificationToggleFailure ||
          current is SettingsNotificationToggleSuccess ||
          current is SettingsNotificationToggleLoading||
          current is SettingsNotificationChanged,
      builder: (context, state) {
        return ListTile(
          //   contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          leading: SvgPicture.asset(
            AssetIcons.bellSvg,
            color: AppColors.darkGrey2,
          ),
          title: Text(AppStrings.notifications.tr(),
              style: TextStyles.rubik13W400Black),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
          trailing: Switch.adaptive(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeTrackColor: AppColors.lightPrimary,
            inactiveThumbColor: AppColors.darkGrey2,
            //   thumbColor: WidgetStateProperty.all(AppColors.white),
            value: cubit.isNotificationEnabled,
            onChanged: (value) {
              cubit.changeNotificationStatus(value);
               cubit.toggleNotification();
            },
          ),
          onTap: () {
           
          },
        );
      },
    );
  }
}
