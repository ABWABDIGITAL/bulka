import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddCvDescription extends StatelessWidget {
  const AddCvDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Upload files in PDF format up to 5 MB. Just upload it once and you can use it in your next application.'
          .tr(),
      style: TextStyles.rubik18W300HardGrey
          .copyWith(fontSize: 10.sp),
    );
  }
}
