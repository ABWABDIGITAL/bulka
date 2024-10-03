import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/settings/controller/settings_cubit.dart';
import 'package:bulka/modules/settings/views/widgets/country_list_tile.dart';
import 'package:bulka/modules/settings/views/widgets/language_list_tile.dart';
import 'package:bulka/modules/settings/views/widgets/light_mode_list_tile.dart';
import 'package:bulka/modules/settings/views/widgets/notification_list_tile.dart';
import 'package:bulka/modules/settings/views/widgets/password_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<SettingsCubit>(),
      child: Scaffold(
        appBar: CustomAppBarWidget(
          title: AppStrings.settings.tr(),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                        blurStyle: BlurStyle.outer,
                        offset: const Offset(0, 0),
                        blurRadius: 40,
                        color: AppColors.black.withOpacity(0.07))
                  ]),
              child: const Column(
                children: [
                  NotifiactionsListTile(),
                  Divider(),
                  CountryListTile(),
                  Divider(),
                  LanguageListTile(),
                  Divider(),
                  LightModeListTile(),
                  Divider(),
                  PasswordListTile(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
