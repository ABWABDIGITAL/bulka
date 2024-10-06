import 'dart:developer';

import 'package:bulka/core/assets/asset_flags.dart';
import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
import 'package:bulka/modules/logout/view/widgets/logout_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool _isNotificationEnabled = true;
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListTile(
          onTap: () {
           showLogoutDialog(context);
          },
          leading: SvgPicture.asset(AssetIcons.bellSvg),
          title: const Text(
            'Notification',
          ),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}

class CustomProfileListTile extends StatelessWidget {
  final String title;
  final Widget trailing;
  final String leading;

  const CustomProfileListTile({
    super.key,
    required this.title,
    required this.trailing,
    required this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //   contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      leading: SvgPicture.asset(leading),
      title: Text(title, style: TextStyles.rubik13W400Black),
      trailing: trailing,
      onTap: () {
        // Handle tile tap if needed
      },
    );
  }
}
