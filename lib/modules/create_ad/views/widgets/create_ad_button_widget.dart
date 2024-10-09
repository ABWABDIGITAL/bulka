import 'package:bulka/core/services/api_handler/api_response_code.dart';
import 'package:bulka/core/services/category_fields/controller/cubit/category_fields_cubit.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/create_ad/controller/cubit/create_ad_cubit.dart';
import 'package:bulka/modules/create_ad/controller/cubit/create_ad_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAdButtonWidget extends StatelessWidget {
  const CreateAdButtonWidget({
    super.key,
    required this.categoryFieldCubit,
  });
  final CategoryFieldsCubit categoryFieldCubit;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CreateAdCubit>();
    return BlocConsumer<CreateAdCubit, CreateAdState>(
      listenWhen: (previous, current) =>
          current is CreateAdLoading ||
          current is CreateAdSuccess ||
          current is CreateAdError,
      listener: (context, state) {
        if (state is CreateAdSuccess) {
          context.pop();
          Dialogs.customeToast(
            text: state.createAdEntity.message,
            context: context,
            isSuccess: true,
          );
        }
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
          onPressed: () {
            if (cubit.formKey.currentState!.validate()) {
              cubit.formKey.currentState!.save();
            } else {
              cubit.scrollController
                  .animateTo(0, duration: 500.ms, curve: Curves.easeIn);
              return;
            }
            if (cubit.media.isEmpty) {
              Dialogs.errorDialog(
                context: context,
                error: ApiErrorEntity(
                  status: false,
                  code: ResponseCode.validationError,
                  message: AppStrings.imagesAreRequired.tr(),
                  errors: [
                    AppStrings.imagesAreRequired.tr(),
                  ],
                ),
              );
              return;
            }

            for (var element in categoryFieldCubit.dynamicKeys) {
              if (element.currentState!.validate()) {
                element.currentState!.save();
              } else {
                return;
              }
            }
            if (cubit.preferedContact == null) {
              Dialogs.errorDialog(
                context: context,
                error: ApiErrorEntity(
                  status: false,
                  code: ResponseCode.validationError,
                  message: AppStrings.preferedContact.tr(),
                  errors: [
                    AppStrings.preferedContact.tr(),
                  ],
                ),
              );
              return;
            }
            cubit.setAdCategoriesField =
                categoryFieldCubit.selectedCategoriesFields;

            cubit.createAdStatesHandled();
          },
        );
      },
    );
  }
}
