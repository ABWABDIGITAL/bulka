import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/authentication/login/ui/views/login_screen.dart';
import 'package:bulka/modules/logout/controller/logout_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

void showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext _) {
      return BlocProvider(
        create: (context) => LogoutCubit(sl()),
        child: BlocConsumer<LogoutCubit, LogoutState>(
          listener: (context, state) {
            if (state is LogoutLoaded) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(state.message),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('OK'.tr()),
                    ),
                  ],
                ),
              );
              context.pushOffAll(const LoginScreen());
            }
            //TODO: refactor this
            if (state is LogoutError) {
              Dialogs.errorDialog(context: context, error: state.error);
              /*  context.pushNamedAndRemoveUntil(Routes.selectUser,
                  predicate: (route) => false); */

/*               context.pop();
              Dialogs.errorDialog(context: context, error: state.error);
 */
            }
          },
          builder: (context, state) {
            var cubit = context.read<LogoutCubit>();
            return AlertDialog(
              icon: CircleAvatar(
                  backgroundColor: AppColors.primary500.withOpacity(.15),
                  radius: 54,
                  child: SvgPicture.asset(AssetIcons.logoutSvg)),
              title: Text(
                "${AppStrings.logout.tr()} 🥲",
                style: TextStyles.rubik17W500Black,
              ),
              content: Text(
                AppStrings.ifThisIsDueToAProblem.tr(),
                style: TextStyles.rubik14W400DarkGrey2,
              ),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: <Widget>[
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: TextStyles.rubik14W500White,
                          backgroundColor: AppColors.primary,
                        ),
                        onPressed: () {
                          // Close the dialog
                          // Perform logout action here
                        },
                        child: Text(
                          AppStrings.contact.tr(),
                          style: TextStyles.rubik14W500White,
                        ),
                      ),
                    ),
                    hSpace(8),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          textStyle: TextStyles.rubik14W500MediumGrey8,
                          backgroundColor: AppColors.mediumGrey15,
                        ),
                        onPressed: () {
                          //  cubit.logout();
                        },
                        child: Text(
                          AppStrings.yes.tr(),
                          style: TextStyles.rubik14W500MediumGrey8,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      );
    },
  );
}