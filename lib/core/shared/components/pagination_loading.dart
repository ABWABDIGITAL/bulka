import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/widgets/loading/logo_loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PagginationLoadingWidget extends StatelessWidget {
  const PagginationLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30,
                  child: LogoLoadingWidget(height: 80, width: 80),
                ),
              ],
            ),
          ),
          Text(
            'Loading', //AppStrings.loading.tr(),
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.grey,
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
