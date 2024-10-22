import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/certifications/controllers/certification_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddCertificationEndDate extends StatefulWidget {
  const AddCertificationEndDate({super.key});

  @override
  State<AddCertificationEndDate> createState() =>
      _AddCertificationEndDateState();
}

class _AddCertificationEndDateState extends State<AddCertificationEndDate> {
  endDateMethod() async {
    final cubit = context.read<CertificationCubit>();
    await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001, 1, 1),
      lastDate: DateTime(2025, 12, 30),
    ).then((value) {
      setState(() {
        cubit.endDate = value;
         cubit.endDateController.text =
            '${cubit.endDate!.day}/${cubit.endDate!.month}/${cubit.endDate!.year}';
     
      });
      if (value == null) {
        return;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CertificationCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.endDate.tr(),
          style: TextStyles.rubik14W500Black,
        ),
        vSpace(8),
          Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.endDate.tr(),
              style: TextStyles.rubik14W500Black,
            ),
            vSpace(8),
            SizedBox(
              width: MediaQuery.of(context).size.width / 2 - 4,
              child: DefaultFormField(
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 24,
                  minHeight: 24,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset(AssetIcons.calenderSvg,
                      color: AppColors.darkGrey5),
                ),
                controller: cubit.endDateController,
                hintText: 'dd/mm/yy',
                onTap: () async {
                  await endDateMethod();
                },
              ),
            )
          ],
        ),
      ),],
    );
  }
}
