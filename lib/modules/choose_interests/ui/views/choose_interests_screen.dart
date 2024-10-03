import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/modules/choose_interests/controllers/choose_interests_cubit.dart';
import 'package:bulka/modules/choose_interests/ui/widgets/choose_interests_body_widget.dart';
import 'package:bulka/modules/choose_interests/ui/widgets/send_interests_button_widget.dart';
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
        appBar: const CustomAppBarWidget(height: 0),
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
