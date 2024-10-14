import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/settings/controller/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SettingsLightModeListTile extends StatelessWidget {
  const SettingsLightModeListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();
    return BlocBuilder<SettingsCubit, SettingsState>(
      builder: (context, state) {
        return ListTile(
          //   contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          leading: SvgPicture.asset(AssetIcons.modeSvg),
          title: Text('lightmode', style: TextStyles.rubik13W400Black),

          trailing: Switch.adaptive(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            activeTrackColor: AppColors.lightPrimary,
            inactiveThumbColor: AppColors.darkGrey2,
            value: cubit.isLightMode,
            onChanged: (value) {
              cubit.changeLightModeStatus(value);
            },
          ),
          onTap: () {},
        );
      },
    );
  }
}
