import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/packages/controller/cubit/packages_cubit.dart';
import 'package:bulka/modules/packages/controller/cubit/packages_state.dart';
import 'package:bulka/modules/packages/data/params/subscribe_params.dart';
import 'package:bulka/modules/packages/views/screens/package_payment_details_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubscribeButtonWidget extends StatelessWidget {
  const SubscribeButtonWidget({
    super.key,
    required this.params,
  });
  final SubscribeParams params;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PackagesCubit, PackagesState>(
      listenWhen: (previous, current) =>
          current is GetSubscribeLoading ||
          current is GetSubscribeSuccess ||
          current is GetSubscribeError,
      listener: (context, state) {
        if (state is GetSubscribeSuccess) {
          context.pushReplacement(PaymentScreen(
            subscribe: state.subscribe,
          ));
        }
      },
      buildWhen: (previous, current) =>
          current is GetSubscribeLoading ||
          current is GetSubscribeSuccess ||
          current is GetSubscribeError,
      builder: (context, state) {
        return DefaultButton(
          backgroundColor: AppColors.white,
          isLoading: state is GetSubscribeLoading ? true : false,
          onPressed: () {
            context.read<PackagesCubit>().subscribeStatesHandled(params);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppStrings.subscribe.tr(),
                style: TextStyles.rubik13W500Primary.copyWith(
                  color: const Color(0xFF573CFF),
                ),
              ),
              hSpace(20),
              SvgPicture.asset(
                AssetIcons.degree45ArrowSvg,
                height: 11,
                width: 11,
              )
            ],
          ),
        );
      },
    );
  }
}
