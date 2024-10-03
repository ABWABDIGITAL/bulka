import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/services/api_handler/api_response_code.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/widgets/buttons/default_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ErrorFullScreen extends StatefulWidget {
  const ErrorFullScreen({
    super.key,
    required this.error,
    this.onPressed,
  });
  final ApiErrorEntity error;
  final void Function()? onPressed;

  @override
  State<ErrorFullScreen> createState() => _ErrorFullScreenState();
}

class _ErrorFullScreenState extends State<ErrorFullScreen> {
  @override
  void initState() {
    super.initState();
    HapticFeedback.mediumImpact();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.error.code == ResponseCode.unAuthorized) {
        // logout(context);?
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            widget.error.code == 404
                ? AssetImages.error404
                : AssetImages.errorImage,
            height: 200.h,
            width: 200.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.error.code.toString(),
                  style: TextStyles.rubik16W700Black.copyWith(fontSize: 12.sp),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
                vSpace(12),
                Text(
                  widget.error.code == 404
                      ? AppStrings.pageNotFound.tr()
                      : widget.error.message,
                  style: TextStyles.rubik16W700Black.copyWith(fontSize: 12.sp),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
                vSpace(12),
                if (widget.error.errors != null &&
                    widget.error.errors!.isNotEmpty)
                  for (int i = 0; i < widget.error.errors!.length && i < 4; i++)
                    Text(
                      widget.error.errors![i],
                      style: TextStyles.rubik16W700Black.copyWith(
                        fontSize: 12.sp,
                        color: AppColors.greyFont,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 4,
                    ),
              ],
            ),
          ),
          Text(
            AppStrings.weApologizeForTheInconvenicence.tr(),
            style: TextStyles.rubik16W700Black,
            textAlign: TextAlign.center,
          ),
          vSpace(15),
          DefaultButton(
            text: AppStrings.reloadAgain.tr(),
            onPressed: widget.onPressed,
            borderRadiusValue: 6.r,
          )
        ],
      ),
    );
  }
}
