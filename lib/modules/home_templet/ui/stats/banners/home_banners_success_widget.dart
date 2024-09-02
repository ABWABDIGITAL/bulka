import 'package:bulka/modules/home_templet/data/entity/banner_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBannersSuccessWidget extends StatefulWidget {
  const HomeBannersSuccessWidget(this.banners, {super.key});
  final List<BannerEntity> banners;
  @override
  State<HomeBannersSuccessWidget> createState() =>
      _HomeBannersSuccessWidgetState();
}

class _HomeBannersSuccessWidgetState extends State<HomeBannersSuccessWidget> {
  @override
  Widget build(BuildContext context) {
    /// implement design
    return SliverToBoxAdapter(
      child:
          widget.banners.isEmpty ? const SizedBox() : SizedBox(height: 120.h),
    );
  }
}
