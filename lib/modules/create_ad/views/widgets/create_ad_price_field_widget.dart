import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/create_ad/controller/cubit/create_ad_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAdPriceFieldWidget extends StatelessWidget {
  const CreateAdPriceFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultFormField(
      hintText: AppStrings.thePrice.tr(),
      onChanged: (value) {},
      onSaved: (newValue) {
        context.read<CreateAdCubit>().priceController.text = newValue ?? "";
      },
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
      ],
      prefixIcon: const Icon(
        Icons.text_snippet,
        color: AppColors.iconGrey,
      ),
    );
  }
}
