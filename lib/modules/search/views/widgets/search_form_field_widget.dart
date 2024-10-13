import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/custom_linear_progress_widget.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/form_fields/default_form_field.dart';
import 'package:bulka/modules/search/controller/cubit/search_cubit.dart';
import 'package:bulka/modules/search/controller/cubit/search_state.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchFormFieldWidget extends StatelessWidget {
  const SearchFormFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      buildWhen: (previous, current) =>
          current is SearchLoading ||
          current is SearchSuccess ||
          current is SearchError ||
          current is AddSearchText,
      builder: (context, state) {
        final cubit = context.read<SearchCubit>();
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(18.r),
                child: DefaultFormField(
                  needValidation: false,
                  enabled: false,
                  borderColor: AppColors.white,
                  borderRadious: 12.r,
                  prefixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetIcons.searchSvg,
                        height: 18.h,
                        width: 18.w,
                      ),
                    ],
                  ),
                  hintText: AppStrings.seachAboutSomeThingHere.tr(),
                  suffixIcon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AssetIcons.filterSvg,
                        height: 18.h,
                        width: 18.w,
                      ),
                    ],
                  ),
                  controller: cubit.search,
                  onChanged: (value) {
                    cubit.debounce.run(() {
                      cubit.addSearchText();
                      if (value.isNotEmpty) {
                        cubit.searchStatesHandled();
                      }
                    });
                  },
                ),
              ),
              if (state is SearchLoading) const CustomLinearProgressWidget()
            ],
          ),
        );
      },
    );
  }
}
