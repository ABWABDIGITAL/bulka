import 'package:bulka/core/services/categories/views/default_category_drop_down_widget.dart';
import 'package:bulka/core/services/category_fields/controller/cubit/category_fields_cubit.dart';
import 'package:bulka/core/services/category_fields/controller/cubit/category_fields_state.dart';
import 'package:bulka/core/services/category_fields/data/params/category_field_params.dart';
import 'package:bulka/core/services/category_fields/view/screens/default_category_fields_widget.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/services/sub_subcategory/controller/cubit/sub_subcategory_cubit.dart';
import 'package:bulka/core/services/sub_subcategory/view/screens/default_subcategory_field_widget.dart';
import 'package:bulka/core/services/subcategory/controller/cubit/subcategory_cubit.dart';
import 'package:bulka/core/services/subcategory/view/screens/default_subcategory_field_widget.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/upload_multiable_images_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/create_ad/controller/cubit/create_ad_cubit.dart';
import 'package:bulka/modules/create_ad/controller/cubit/create_ad_state.dart';
import 'package:bulka/modules/create_ad/views/widgets/create_ad_button_widget.dart';
import 'package:bulka/modules/create_ad/views/widgets/create_ad_description_field_widget.dart';
import 'package:bulka/modules/create_ad/views/widgets/create_ad_name_field_widget.dart';
import 'package:bulka/modules/create_ad/views/widgets/create_ad_price_field_widget.dart';
import 'package:bulka/modules/create_ad/views/widgets/create_ad_title_widget.dart';
import 'package:bulka/modules/create_ad/views/widgets/prefered_contact_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateAdScreen extends StatelessWidget {
  const CreateAdScreen({
    super.key,
    required this.adType,
    required this.isPromoted,
  });
  final AdType adType;
  final bool isPromoted;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateAdCubit>(
          create: (context) => CreateAdCubit(sl())
            ..setIsPromoted = isPromoted
            ..adType = adType,
        ),
        BlocProvider<SubcategoryCubit>(
            create: (context) => SubcategoryCubit(sl())),
        BlocProvider<SubSubcategoryCubit>(
            create: (context) => SubSubcategoryCubit(sl())),
        BlocProvider<CategoryFieldsCubit>(
          create: (context) => CategoryFieldsCubit(sl())
            ..categoryFieldsStatesHandled(
              const CategoryFieldParams(categoryId: 10),
            ),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBarWidget(),
        body: BlocBuilder<CreateAdCubit, CreateAdState>(
          builder: (context, state) {
            final cubit = context.read<CreateAdCubit>();
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SingleChildScrollView(
                controller: cubit.scrollController,
                child: Form(
                  key: context.read<CreateAdCubit>().formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //---------------------//
                      CreateAdTitleWidget(
                        title: '${AppStrings.adTitle.tr()}*',
                      ),
                      const CreateAdNameFieldWidget(),
                      const SizedBox(height: 20),
                      //---------------------//
                      CreateAdTitleWidget(
                        title: '${AppStrings.adDescription.tr()}*',
                      ),
                      const CreateAdDescriptionFieldWidget(),
                      const SizedBox(height: 20),
                      //---------------------//
                      if (adType != AdType.jobs && adType != AdType.posts)
                        CreateAdTitleWidget(
                          title: '${AppStrings.thePrice.tr()}*',
                        ),
                      if (adType != AdType.jobs && adType != AdType.posts)
                        const CreateAdPriceFieldWidget(),
                      if (adType != AdType.jobs && adType != AdType.posts)
                        const SizedBox(height: 20),
                      //---------------------//
                      CreateAdTitleWidget(
                        title: '${AppStrings.theCategory.tr()}*',
                      ),
                      DefaultCategoryDropdownWidget(
                        needTitle: false,
                        onSelected: (choosenCategory) {
                          cubit.categoryId = choosenCategory!.id;
                          cubit.getSubcategoryByCategory(context);
                        },
                      ),
                      const SizedBox(height: 20),
                      //---------------------//
                      DefaultSubcategoryFieldWidget(
                        subcategoryCubit: context.read<SubcategoryCubit>(),
                        params: cubit.getSubcategoryParams(),
                        hintText: AppStrings.exploreSubCategories.tr(),
                        titleText: AppStrings.theSubCategory.tr(),
                        titleStyle: TextStyles.rubik13W500HardGrey2,
                        needTitle: false,
                        onSelected: (choosenSubCategory) {
                          cubit.subcategoryId = choosenSubCategory!.id;
                          cubit.getSubSubcategoryBySubCategory(context);
                        },
                      ),
                      //---------------------//
                      DefaultSubSubcategoryFieldWidget(
                        subSubCubit: context.read<SubSubcategoryCubit>(),
                        hintText:
                            AppStrings.exploreSubInsideTheSubCategories.tr(),
                        titleText: AppStrings.theSpecializeOfSubCategory.tr(),
                        titleStyle: TextStyles.rubik13W500HardGrey2,
                        params: cubit.getSubSubcategoryParams(),
                        needTitle: false,
                        onSelected: (choosenSubSubCategory) {
                          cubit.subSubcategoryId = choosenSubSubCategory!.id;
                        },
                      ),
                      //---------------------//
                      CreateAdTitleWidget(
                        title: '${AppStrings.adImages.tr()}*',
                      ),
                      UploadMultiableImagesWidget(
                        onSelected: (onSelected) {
                          cubit.setMedia = onSelected;
                        },
                      ),
                      const SizedBox(height: 20),
                      //---------------------//
                      DefaultCategoryFieldsWidget(
                        params: const CategoryFieldParams(categoryId: 10),
                        categoryFieldsCubit:
                            context.read<CategoryFieldsCubit>(),
                      ),
                      //---------------------//
                      CreateAdTitleWidget(
                        title: '${AppStrings.prefedContact.tr()}*',
                      ),
                      PreferedContactWidget(
                        onSelected: (choosenPreferedContact) {
                          cubit.setPreferedContact = choosenPreferedContact!;
                        },
                      ),
                      const SizedBox(height: 20),
                      //---------------------//
                      CreateAdButtonWidget(
                        categoryFieldCubit: context.read<CategoryFieldsCubit>(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
