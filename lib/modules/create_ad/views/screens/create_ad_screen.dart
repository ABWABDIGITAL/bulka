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
  const CreateAdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateAdCubit>(create: (context) => CreateAdCubit(sl())),
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
                child: Form(
                  key: context.read<CreateAdCubit>().formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        onSelected: (onSelected) {},
                      ),
                      const SizedBox(height: 20),
                      //---------------------//
                      BlocConsumer<CategoryFieldsCubit, CategoryFieldsState>(
                        listenWhen: (previous, current) =>
                            current is GetCategoryFieldsSuccess,
                        listener: (context, state) {
                          if (state is GetCategoryFieldsSuccess) {
                            cubit.setDynamicKeys = state.categoryFields.length;
                          }
                        },
                        buildWhen: (previous, current) =>
                            current is GetCategoryFieldsSuccess,
                        builder: (context, state) =>
                            DefaultCategoryFieldsWidget(
                          params: const CategoryFieldParams(categoryId: 10),
                          categoryFieldsCubit:
                              context.read<CategoryFieldsCubit>(),
                          onFinish: (onFinish) {
                            // print(onFinish.toString());
                            // for (CreateAdCategoryField element
                            //     in onFinish ?? []) {
                            //   print(element.toString());
                            // }
                          },
                          selectedCategoriesFields:
                              cubit.selectedCategoriesFields,
                          dynamicKeys: cubit.dynamicKeys,
                        ),
                      ),
                      //---------------------//
                      CreateAdTitleWidget(
                        title: '${AppStrings.prefedContact.tr()}*',
                      ),
                      const PreferedContactWidget(),
                      const SizedBox(height: 20),
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
                      CreateAdTitleWidget(
                        title: '${AppStrings.thePrice.tr()}*',
                      ),
                      const CreateAdPriceFieldWidget(),
                      const SizedBox(height: 20),
                      //---------------------//
                      const CreateAdButtonWidget(),
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
