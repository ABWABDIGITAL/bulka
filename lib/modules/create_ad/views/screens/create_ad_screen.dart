import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/services/sub_subcategory/data/params/sub_subcategory_params.dart';
import 'package:bulka/core/services/sub_subcategory/view/screens/default_subcategory_field_widget.dart';
import 'package:bulka/core/services/subcategory/data/params/subcategory_params.dart';
import 'package:bulka/core/services/subcategory/view/screens/default_subcategory_field_widget.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/upload_multiable_images_widget.dart';
import 'package:bulka/core/services/categories/views/default_category_drop_down_widget.dart';
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
    return BlocProvider(
      create: (context) => CreateAdCubit(sl()),
      child: Scaffold(
        appBar: const CustomeAppBarWidget(),
        body: BlocBuilder<CreateAdCubit, CreateAdState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SingleChildScrollView(
                child: Form(
                  key: context.read<CreateAdCubit>().formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CreateAdTitleWidget(title: 'title'),
                      const DefaultCategoryDropdownWidget(
                        needTitle: false,
                      ),
                      const SizedBox(height: 20),
                      //---------------------//
                      const CreateAdTitleWidget(title: 'title'),
                      const DefaultSubcategoryFieldWidget(
                        params: SubcategoryParams(categoryId: 1),
                        needTitle: false,
                      ),
                      const SizedBox(height: 20),
                      //---------------------//
                      const CreateAdTitleWidget(title: 'title'),
                      const DefaultSubSubcategoryFieldWidget(
                        params: SubSubcategoryParams(subcategoryId: 1),
                        needTitle: false,
                      ),
                      const SizedBox(height: 20),
                      //---------------------//
                      const CreateAdTitleWidget(title: 'title'),
                      UploadMultiableImagesWidget(
                        onSelected: (onSelected) {},
                      ),
                      const SizedBox(height: 20),
                      //---------------------//
                      // const CreateAdTitleWidget(title: 'title'),
                      // DefaultCategoryFieldWidget(),
                      // const SizedBox(height: 20),
                      //---------------------//
                      const CreateAdTitleWidget(title: 'title'),
                      const PreferedContactWidget(),
                      const SizedBox(height: 20),
                      //---------------------//
                      const CreateAdTitleWidget(title: 'title'),
                      const CreateAdNameFieldWidget(),
                      const SizedBox(height: 20),
                      //---------------------//
                      const CreateAdTitleWidget(title: 'title'),
                      const CreateAdDescriptionFieldWidget(),
                      const SizedBox(height: 20),
                      //---------------------//
                      CreateAdTitleWidget(title: AppStrings.thePrice.tr()),
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
