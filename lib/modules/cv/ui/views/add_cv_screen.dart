import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/cv/controllers/add/add_cv_cubit.dart';
import 'package:bulka/modules/cv/controllers/add/add_cv_state.dart';
import 'package:bulka/modules/cv/ui/widgets/add_cv_card.dart';
import 'package:bulka/modules/cv/ui/widgets/add_cv_description.dart';
import 'package:bulka/modules/cv/ui/widgets/add_cv_upload_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCvScreen extends StatelessWidget {
  const AddCvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCvCubit(sl()),
      child: Scaffold(
        appBar: OpacityAppbarWidget(title: AppStrings.cv.tr()),
        body: Padding(
          padding: EdgeInsets.all(24.r),
          child: BlocBuilder<AddCvCubit, AddCvState>(
            buildWhen: (previous, current) => previous != current,
            builder: (context, state) {
              final cubit = context.read<AddCvCubit>();
              return Column(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.addCv.tr(),
                          style: TextStyles.rubik14W500Black,
                        ),
                        vSpace(10),
                        AddCvCard(cubit: cubit),
                        vSpace(20),
                        const AddCvDescription()
                      ],
                    ),
                  ),
                  const AddCvUploadButton(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
