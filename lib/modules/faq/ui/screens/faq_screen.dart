import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/faq/controllers/faq_cubit.dart';
import 'package:bulka/modules/faq/ui/widgets/faq_list_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(
        title: AppStrings.faqs.tr(),
        titleStyle: TextStyles.rubik14W500Black,
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => FaqCubit(sl())..getFaqs(),
        child: const FaqListView(),
      ),
    );
  }
}
