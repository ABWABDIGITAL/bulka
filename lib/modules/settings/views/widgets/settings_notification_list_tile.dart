import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
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
    return BlocBuilder<SettingsCubit, SettingsState>(
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
            },
          ),
          onTap: () {
            // Handle tile tap if needed
          },
        );
      },
    );
  }
}
