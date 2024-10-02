import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/create_ad/controller/cubit/create_ad_cubit.dart';
import 'package:bulka/modules/create_ad/controller/cubit/create_ad_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAdButtonWidget extends StatelessWidget {
  const CreateAdButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateAdCubit, CreateAdState>(
      listenWhen: (previous, current) =>
          current is CreateAdLoading ||
          current is CreateAdSuccess ||
          current is CreateAdError,
      listener: (context, state) {
        if (state is CreateAdSuccess) {}
        if (state is CreateAdError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
      },
      buildWhen: (previous, current) =>
          current is CreateAdLoading ||
          current is CreateAdSuccess ||
          current is CreateAdError,
      builder: (context, state) {
        return DefaultButton(
          isLoading: state is CreateAdLoading ? true : false,
          text: AppStrings.createAd.tr(),
          onPressed: () {},
        );
      },
    );
  }
}
