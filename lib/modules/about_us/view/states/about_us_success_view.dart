import 'dart:io';

import 'package:bulka/core/services/handlers/url_launcher_handler.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/about_us/data/entities/about_us_entity.dart';
import 'package:flutter/material.dart';

class AboutUsSuccessView extends StatelessWidget {
   final List<AboutUsEntity> aboutUsEntity;
  const AboutUsSuccessView({
    super.key,
    required this.aboutUsEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.darkGrey3),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: aboutUsEntity.length,
        separatorBuilder: (context, index) =>
            const Divider(height: 1, color: AppColors.darkGrey3),
        itemBuilder: (context, index) => ListTile(
          title: Text(aboutUsEntity[index].name),
          trailing: Icon(
              Platform.isIOS ? Icons.arrow_forward_ios : Icons.arrow_forward),
          onTap: () {
            UrlLauncherHandler.openURL(url: aboutUsEntity[index].link);
          },
        ),
      ),
    );}
}