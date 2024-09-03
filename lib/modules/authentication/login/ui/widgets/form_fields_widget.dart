import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_email_form_field_widget.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_password_form_field_widget.dart';
import 'package:bulka/core/utils/widgets/validation/validation.dart';
import 'package:bulka/modules/authentication/login/controllers/login_cubit.dart';
import 'package:bulka/modules/authentication/login/controllers/login_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormFieldsWidget extends StatelessWidget {
  const LoginFormFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.r),
      child: Column(
        children: [
          DefaultEmailFormFieldWidget(
            controller: cubit.emailController,
          ),
          vSpace(20),
          BlocBuilder<LoginCubit, LoginState>(
            buildWhen: (previous, current) => current is ChangePasswordStatus,
            builder: (context, state) {
              return DefaultPasswordFormFieldWidget(
                controller: cubit.passwordController,
                isVisiable: cubit.isVisiable,
                changeVisiabiltyOnPressed: () {
                  cubit.changeVisibility();
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
