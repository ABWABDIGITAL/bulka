import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/home/ui/views/home_screen.dart';
import 'package:bulka/modules/home/ui/widgets/home_appbar_widget.dart';
import 'package:bulka/modules/import_and_export/ui/views/import_and_export_screen.dart';
import 'package:bulka/modules/navbar_layout/controllers/navbar_layout_cubit.dart';
import 'package:bulka/modules/navbar_layout/controllers/navbar_layout_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavbarLayoutScreen extends StatelessWidget {
  const NavbarLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavbarLayoutCubit(),
      child: BlocBuilder<NavbarLayoutCubit, NavbarLayoutState>(
        buildWhen: (previous, current) => current is HomeBottomNavState,
        builder: (context, state) {
          final cubit = context.read<NavbarLayoutCubit>();
          return Scaffold(
            appBar: cubit.navAppbars[cubit.currentIndex],
            bottomNavigationBar: SizedBox(
              height: 90.h,
              child: BottomNavigationBar(
                selectedLabelStyle:
                    TextStyles.rubik10W400Primary.copyWith(fontSize: 12.sp),
                unselectedLabelStyle: TextStyles.rubik10W400Primary
                    .copyWith(color: AppColors.mediumGrey5),
                backgroundColor: AppColors.white,
                elevation: 1,
                showUnselectedLabels: true,
                items: cubit.items,
                showSelectedLabels: true,
                selectedItemColor: AppColors.primary,
                unselectedItemColor: AppColors.mediumGrey5,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.changeIndex(index);
                },
                type: BottomNavigationBarType.fixed,
              ),
            ),
            body: cubit.navbarScreens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
