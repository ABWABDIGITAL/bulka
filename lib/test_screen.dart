import 'dart:developer';

import 'package:bulka/core/assets/asset_flags.dart';
import 'package:bulka/core/assets/asset_icons.dart';
import 'package:bulka/core/theme/text_styles/text_styles.dart';
import 'package:bulka/core/utils/constant/app_colors.dart';
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
        child: Container(
          //padding: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.grey),
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              ListTile(
                leading: SvgPicture.asset(AssetIcons.bellSvg),
                title: const Text(
                  'Notification',
                ),
                trailing: Switch(
                    activeColor: AppColors.primary,
                    value: _isNotificationEnabled,
                    onChanged: (value) {
                      setState(() {
                        _isNotificationEnabled = value;
                      });
                    }),
              ),
              CustomProfileListTile(
                leading: AssetIcons.bellSvg,
                title: 'Notifications',
                trailing: Switch(
                  value: _isNotificationEnabled,
                  onChanged: (value) {
                    setState(() {
                      log('test');
                      value = !_isNotificationEnabled;
                    });
                  },
                ),
              ),
              // Notification Switch
              const Divider(),
              CustomProfileListTile(
                leading: AssetIcons.countrySvg,
                title: 'Country',
                trailing: SvgPicture.asset(AssetFlags.emirates),
              ),
              // Country
              const Divider(),
              CustomProfileListTile(
                leading: AssetIcons.language2,
                title: 'Language',
                trailing:
                    Text('English', style: TextStyles.rubik12W600MediumGrey12),
              ),
              // Language

              const Divider(),
              CustomProfileListTile(
                  title: 'Mode',
                  trailing: Switch(
                    value: _isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        _isDarkMode = value;
                      });
                    },
                  ),
                  leading: AssetIcons.modeSvg),
              // Mode Switch

              const Divider(),
              const CustomProfileListTile(
                  title: 'Password',
                  trailing: Icon(Icons.arrow_forward_ios),
                  leading: AssetIcons.lock1),
              // Password
            ],
          ),
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
