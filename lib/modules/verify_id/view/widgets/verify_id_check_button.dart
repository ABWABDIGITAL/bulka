import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/verify_id/controllers/verify_id_cubit.dart';
import 'package:bulka/modules/verify_id/view/widgets/verify_id_third_view/verify_id_third_view_bottom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyIdCheckButton extends StatefulWidget {
  
  VerifyIdCheckButton({
    super.key,
   
  });

  @override
  State<VerifyIdCheckButton> createState() => _VerifyIdCheckButtonState();
}

class _VerifyIdCheckButtonState extends State<VerifyIdCheckButton> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<VerifyIdCubit>();
    return BlocConsumer<VerifyIdCubit, VerifyIdState>(
      listenWhen: (previous, current) =>
          current is VerifyIdLoading ||
          current is VerifyIdLoaded ||
          current is VerifyIdError ||
          current is VerifyIdUpdateIndex,
      listener: (context, state) {
        if (state is VerifyIdError) {
          Dialogs.errorDialog(context: context, error: state.error);
        }
        if (state is VerifyIdLoaded) {
          context.pop();
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
            ),
            builder: (BuildContext _) {
              return const VerifyIdThirdViewBottomSheet();
            },
          );
        }
      },
      buildWhen: (previous, current) =>
          current is VerifyIdLoading ||
          current is VerifyIdLoaded ||
          current is VerifyIdError ||
          current is VerifyIdUpdateIndex,
      builder: (context, state) {
        return DefaultButton(
          onPressed: () {
            setState(() {
              if (cubit.currentContentIndex < 2) {
                cubit.updateIndex();
              }
            });
            if (cubit.currentContentIndex == 2) {
              cubit.postVerifyId();
            }
          },
          isLoading: state is VerifyIdLoading ? true : false,
          text: cubit.currentContentIndex == 0
              ? AppStrings.next.tr()
              : AppStrings.check.tr(),

          //  isLoading: state is LoginStateLoading ? true : false,
        );
      },
    );
  }
}
