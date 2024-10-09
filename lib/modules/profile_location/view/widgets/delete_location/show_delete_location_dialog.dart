import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/profile_location/controller/profile_location_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

void showDeleteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext _) {
      return BlocProvider(
        create: (context) => ProfileLocationCubit(),
        child: BlocConsumer<ProfileLocationCubit, ProfileLocationState>(
          listener: (context, state) {
            if (state is ProfileLocationLoaded) {
              /* showDialog(
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
              ); */
            }
            //TODO: refactor this
            if (state is ProfileLocationError) {
              Dialogs.errorDialog(context: context, error: state.error);
              /*  context.pushNamedAndRemoveUntil(Routes.selectUser,
                  predicate: (route) => false); */

/*               context.pop();
              Dialogs.errorDialog(context: context, error: state.error);
 */
            }
          },
          builder: (context, state) {
            var cubit = context.read<ProfileLocationCubit>();
            return AlertDialog(
              icon: CircleAvatar(
                  backgroundColor: AppColors.primary500.withOpacity(.15),
                  radius: 54,
                  child: SvgPicture.asset(AssetIcons.deleteLocationSvg)),
              title: Text(
                "${AppStrings.deleteLocation.tr()} 🥲",
                style: TextStyles.rubik17W500Black,
              ),
              content: Text(
                AppStrings.doYouWantReallyToDeleteThisLocation.tr(),
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
                        onPressed: () {},
                        child: Text(
                          AppStrings.yes.tr(),
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
                          context.pop();
                        },
                        child: Text(
                          AppStrings.no.tr(),
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
