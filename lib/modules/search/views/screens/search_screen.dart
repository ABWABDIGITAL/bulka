
import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/assets/asset_translations.dart';

import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/components/pagination_loading.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/core/utils/widgets/responsive/responsive.dart';
import 'package:bulka/modules/search/controller/cubit/search_cubit.dart';
import 'package:bulka/modules/search/controller/cubit/search_state.dart';
import 'package:bulka/modules/search/views/stats/search_error_state_widget.dart';
import 'package:bulka/modules/search/views/stats/search_initial_state_widget.dart';
import 'package:bulka/modules/search/views/stats/search_loading_state_widget.dart';
import 'package:bulka/modules/search/views/stats/search_success_state_widget.dart';
import 'package:bulka/modules/search/views/widgets/search_form_field_widget.dart';
import 'package:bulka/modules/search/views/widgets/search_no_result_found_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(sl()),
      child: Scaffold(
        appBar: CustomAppBarWidget(
          height: 90,
          backgroundColor: AppColors.opactiyPrimary,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.opactiyPrimary,
            statusBarIconBrightness: Brightness.dark,
          ),
          leadingWidth: 0,
          leading: const SizedBox(),
          flexibleSpace: BlocBuilder<SearchCubit, SearchState>(
            buildWhen: (previous, current) =>
                current is SearchLoading ||
                current is SearchSuccess ||
                current is SearchError ||
                current is AddSearchText,
            builder: (context, state) {
              final cubit = context.read<SearchCubit>();

              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(top: 20),
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: Icon(
                        AssetTranslations.isRightDirectionality
                            ? Icons.arrow_forward_ios
                            : Icons.arrow_back_ios,
                      ),
                    ),
                  ),
                  const Expanded(child: SearchFormFieldWidget()),
                  if (cubit.search.text.isNotEmpty)
                    Padding(
                      padding: const EdgeInsetsDirectional.only(top: 20),
                      child: IconButton(
                        onPressed: () {
                          cubit.search.clear();
                          cubit.addSearchText();
                        },
                        icon: const Icon(
                          Icons.close,
                          color: AppColors.darkGrey,
                        ),
                      ),
                    ).animate().scale(),
                ],
              );
            },
          ),
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          buildWhen: (previous, current) =>
              current is SearchLoading ||
              current is SearchSuccess ||
              current is SearchError ||
              current is SearchInitial,
          builder: (context, state) {
            final cubit = context.read<SearchCubit>();
            final gridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: Responsive.returnValueAdjustResponsive(
                  context, 6, 5, 4, 3, 2),
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 15.h,
              childAspectRatio: 0.7,
            );

            if (state is SearchInitial) {
              return const SearchInitialStateWidget();
            }

            if (state is SearchLoading) {
              if (cubit.searchEntity == null) {
                return SearchLoadingStateWidget(gridDelegate: gridDelegate);
              } else {
                Column(
                  children: [
                    Expanded(
                      child:
                          SearchSuccessStateWidget(gridDelegate: gridDelegate),
                    ),
                    const PagginationLoadingWidget(),
                  ],
                );
              }
            }

            if (cubit.searchEntity != null || state is SearchSuccess) {
              return cubit.searchEntity!.ads.isEmpty
                  ? const SearchNoResultFoundScreen()
                  : SearchSuccessStateWidget(gridDelegate: gridDelegate);
            }

            if (state is SearchError) {
              return SearchErrorStateWidget(error: state.error);
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}
