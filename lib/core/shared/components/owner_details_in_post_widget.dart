import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class OwnerDetailsInPostWidget extends StatelessWidget {
  const OwnerDetailsInPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          'https://images.unsplash.com/photo-1677137856456-42251dccf388?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fEclMjBDTEFTU3xlbnwwfHwwfHx8MA%3D%3D',
        ),
      ),
      title: Text(
        'Mercedes Store',
        style: TextStyles.roboto12W500Black2,
      ),
      subtitle: Text(
        'Just Now',
        style: TextStyles.roboto10W500MediumGrey2,
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AssetIcons.threeDotsSvg,
            height: 6.h,
            width: 18.w,
          )
        ],
      ),
    );
  }
}
