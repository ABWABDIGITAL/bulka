import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
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
            appBar: const CustomeAppBarWidget(),
            bottomNavigationBar: BottomNavigationBar(
              selectedLabelStyle: TextStyles.rubik10W400Primary,
              backgroundColor: AppColors.white,
              elevation: 1,
              showUnselectedLabels: true,
              items: cubit.items,
              showSelectedLabels: true,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              type: BottomNavigationBarType.fixed,
            ),
            body: cubit.navbarScreens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
