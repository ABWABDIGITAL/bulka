import 'package:bulka/core/shared/shimmer/shimmer_container_widget.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/dialogs/dialogs.dart';
import 'package:bulka/modules/about_us/controller/about_us_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TermsScreen extends StatelessWidget {
  final AboutUsCubit cubit;
  const TermsScreen({super.key, required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OpacityAppbarWidget(
        title: AppStrings.termsAndConditions.tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: BlocProvider.value(
            value: cubit..getTerms(),
            child: BlocBuilder<AboutUsCubit, AboutUsState>(
              buildWhen: (previous, current) =>
                  current is TermsLoading ||
                  current is TermsError ||
                  current is TermsLoaded,
              builder: (context, state) {
                if (state is TermsLoading) {
                  return ListView.separated(
                      itemBuilder: (context, index) => ShimmerContainerWidget(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                          ),
                      separatorBuilder: (context, index) => vSpace(16),
                      itemCount: 6);
                }
                if (state is TermsError) {
                  return Dialogs.errorDialog(
                      context: context, error: state.error);
                }
                if (state is TermsLoaded) {
                  return ListView.separated(
                      itemBuilder: (context, index) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.termsEntity[index].title,
                                style: TextStyles.rubik16W700Black,
                              ),
                              Text(
                                state.termsEntity[index].description,
                                style: TextStyles.rubik12W400DarkGrey4,
                              ),
                            ],
                          ),
                      separatorBuilder: (context, index) => vSpace(16),
                      itemCount: state.termsEntity.length);
                }
                return Container();
              },
            )),
      ),
    );
  }
}
