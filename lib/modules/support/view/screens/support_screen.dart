import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/shared/widgets/spacing.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/modules/support/data/entities/support_entity.dart';
import 'package:bulka/modules/support/view/screens/email_support_screen.dart';
import 'package:bulka/modules/support/view/widgets/support_animated_headphone_sparkle.dart';
import 'package:bulka/modules/support/view/widgets/support_list_tile.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<SupportEntity> content = [
      SupportEntity(
          icon: AssetIcons.chatSvg,
          title: AppStrings.contactLiveChat.tr(),
          description: AppStrings.contactLiveChatDescription.tr(),
          onTap: () {}),
      SupportEntity(
          icon: AssetIcons.smsSvg,
          title: AppStrings.sendUsAnEmail.tr(),
          description: AppStrings.sendUsAnEmailDescription.tr(),
          onTap: () {
            context.push(const EmailSupportScreen());
          }),
      SupportEntity(
          icon: AssetIcons.locationSvg,
          title: AppStrings.locationOffice.tr(),
          description: AppStrings.locationOfficeDescription.tr(),
          onTap: () {}),
    ];
    return Scaffold(
      appBar: OpacityAppbarWidget(
        title: AppStrings.support.tr(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            vSpace(20),
            const SupportAnimatedHeadphoneSparkle(),
            vSpace(30),
            Text(
              AppStrings.helloHowWeCanHelpYou.tr(),
              style: TextStyles.rubik20W500Black,
              textAlign: TextAlign.center,
            ),
            vSpace(30),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) => SupportListTile(
                    icon: content[index].icon,
                    title: content[index].title,
                    description: content[index].description,
                    onTap: content[index].onTap),
                separatorBuilder: (context, index) => vSpace(16),
                itemCount: content.length)
          ],
        ),
      ),
    );
  }
}
