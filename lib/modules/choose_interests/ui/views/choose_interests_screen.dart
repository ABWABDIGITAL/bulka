import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:bulka/modules/choose_interests/controllers/choose_interests_cubit.dart';
import 'package:bulka/modules/choose_interests/controllers/choose_interests_state.dart';
import 'package:bulka/modules/choose_interests/ui/stats/get_interests_loading_widget.dart';
import 'package:bulka/modules/choose_interests/ui/stats/get_interests_success_widget.dart';
import 'package:bulka/modules/choose_interests/ui/widgets/choose_interests_body_widget.dart';
import 'package:bulka/modules/choose_interests/ui/widgets/interests_skip_widget.dart';
import 'package:bulka/modules/choose_interests/ui/widgets/send_interests_button_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseInterestsScreen extends StatelessWidget {
  const ChooseInterestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ChooseInterestsCubit(sl())..chooseInterestsStatesHandled(),
      child: Scaffold(
        appBar: const CustomeAppBarWidget(height: 0),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 18.r),
          child: const Column(
            children: [
              Expanded(child: ChooseInterestsBodyWidget()),
              SendInterestsButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
