import 'package:bulka/core/services/categories/data/entity/category_entity.dart';
import 'package:bulka/core/shared/entity/product_entities/product_main_information_entity.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/home/data/entity/home_product_entity.dart';
import 'package:bulka/modules/home/ui/widgets/car_for_sale_list_widget.dart';
import 'package:bulka/modules/home/ui/widgets/home_banner_widget.dart';
import 'package:bulka/modules/home/ui/widgets/home_categories_widget.dart';
import 'package:bulka/modules/home/ui/widgets/home_jops_section_widget.dart';
import 'package:bulka/modules/home/ui/widgets/properties_for_sale_list_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeLoadingWidget extends StatelessWidget {
  const HomeLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const HomeCategoriesWidget(),
          const HomeBannerWidget(isLoading: true),
          vSpace(10),
          PropertiesForSaleListWidget(
            isLoading: true,
            product: [
              HomeProductEntity(
                mainInformation: ProductMainInformationEntity(
                  id: 0,
                  name: AppStrings.loading.tr(),
                  description: AppStrings.loading.tr(),
                  location: AppStrings.loading.tr(),
                  isFav: false,
                  user: AdUserInfoEntity(
                    id: 0,
                    fullName: AppStrings.loading.tr(),
                    userType: UserType.visitor,
                    email: AppStrings.loading.tr(),
                    phoneCode: '000',
                    phone: '000',
                    avatar: '',
                  ),
                  category: CategoryEntity(
                    id: 0,
                    image: '',
                    name: AppStrings.loading.tr(),
                    type: CategoryTypes.cars,
                  ),
                  image: '',
                  price: '00000',
                  adType: ProductCardWidgetDisplay.cars,
                ),
                adMedia: const [],
                adCategoryField: const [],
              ),
            ],
          ),
          vSpace(10),
          CarForSaleListWidget(
            isLoading: true,
            products: [
              HomeProductEntity(
                mainInformation: ProductMainInformationEntity(
                  id: 0,
                  name: AppStrings.loading.tr(),
                  description: AppStrings.loading.tr(),
                  location: AppStrings.loading.tr(),
                  isFav: false,
                  user: AdUserInfoEntity(
                    id: 0,
                    fullName: AppStrings.loading.tr(),
                    userType: UserType.visitor,
                    email: AppStrings.loading.tr(),
                    phoneCode: '000',
                    phone: '000',
                    avatar: '',
                  ),
                  category: CategoryEntity(
                    id: 0,
                    image: '',
                    name: AppStrings.loading.tr(),
                    type: CategoryTypes.cars,
                  ),
                  image: '',
                  price: '00000',
                  adType: ProductCardWidgetDisplay.cars,
                ),
                adMedia: const [],
                adCategoryField: const [],
              ),
            ],
          ),
          vSpace(10),
          HomeJopsSectionWidget(
            isLoading: true,
            products: [
              HomeProductEntity(
                mainInformation: ProductMainInformationEntity(
                  id: 0,
                  name: AppStrings.loading.tr(),
                  description: AppStrings.loading.tr(),
                  location: AppStrings.loading.tr(),
                  isFav: false,
                  user: AdUserInfoEntity(
                    id: 0,
                    fullName: AppStrings.loading.tr(),
                    userType: UserType.visitor,
                    email: AppStrings.loading.tr(),
                    phoneCode: '000',
                    phone: '000',
                    avatar: '',
                  ),
                  category: CategoryEntity(
                    id: 0,
                    image: '',
                    name: AppStrings.loading.tr(),
                    type: CategoryTypes.cars,
                  ),
                  image: '',
                  price: '00000',
                  adType: ProductCardWidgetDisplay.cars,
                ),
                adMedia: const [],
                adCategoryField: const [],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
