import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/custom_linear_progress_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/search/controller/cubit/search_cubit.dart';
import 'package:bulka/modules/search/controller/cubit/search_state.dart';
import 'package:bulka/modules/search/views/widgets/search_form_field_widget.dart';
import 'package:bulka/modules/search/views/widgets/search_no_result_found_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(sl())..searchStatesHandled(),
      child: Scaffold(
        appBar: const CustomAppBarWidget(
          height: 85,
          backgroundColor: AppColors.opactiyPrimary,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.opactiyPrimary,
            statusBarIconBrightness: Brightness.dark,
          ),
          flexibleSpace: SearchFormFieldWidget(),
        ),
        body: BlocBuilder<SearchCubit, SearchState>(
          buildWhen: (previous, current) =>
              current is SearchLoading ||
              current is SearchSuccess ||
              current is SearchError,
          builder: (context, state) {
            return const SearchNoResultFoundScreen();
          },
        ),
      ),
    );
  }
}
