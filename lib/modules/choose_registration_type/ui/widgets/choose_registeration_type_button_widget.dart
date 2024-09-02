import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/choose_registration_type/controllers/choose_registeration_type_cubit.dart';
import 'package:bulka/modules/company_register/ui/views/company_register_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseRegisterationTypeButtonWidget extends StatelessWidget {
  const ChooseRegisterationTypeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChooseRegisterationTypeCubit>();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: DefaultButton(
        borderRadiusValue: 12.r,
        onPressed: () {
          switch (cubit.userRole) {
            case UserRole.company:
              context.push(const CompanyRegisterScreen());
              return;
            case UserRole.user:
              // context.push(const CompanyRegisterScreen());
              return;
            default:
              return;
          }
        },
        text: AppStrings.Continue.tr(),
      ),
    );
  }
}
