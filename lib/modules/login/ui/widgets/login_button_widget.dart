import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/login/controllers/login_cubit.dart';
import 'package:bulka/modules/login/controllers/login_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocConsumer<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is LoginStateLoading ||
          current is LoginStateSuccess ||
          current is LoginStateError,
      listener: (context, state) {
        if (state is LoginStateError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is LoginStateSuccess) {
          Dialogs.successDialog(context);
        }
      },
      buildWhen: (previous, current) =>
          current is LoginStateLoading ||
          current is LoginStateSuccess ||
          current is LoginStateError,
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          child: DefaultButton(
            borderRadiusValue: 12.r,
            onPressed: () async {
              if (cubit.loginKey.currentState!.validate()) {
                cubit.loginKey.currentState!.save();
                FocusScope.of(context).unfocus();
                cubit.loginStatesHandled();
              }
            },
            text: AppStrings.login.tr(),
            isLoading: state is LoginStateLoading ? true : false,
          ),
        );
      },
    );
  }
}
