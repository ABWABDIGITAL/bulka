import 'package:bulka/core/assets/asset_images.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Error Screen Widget implement your design here
/// keep api error entity as a required parameter
/// cuz every error in this app will be an instance of [ApiErrorEntity]
class ErrorScreen extends StatefulWidget {
  const ErrorScreen({
    super.key,
    required this.error,
    this.onPressed,
  });
  final ApiErrorEntity error;
  final void Function()? onPressed;

  @override
  State<ErrorScreen> createState() => _ErrorScreenState();
}

class _ErrorScreenState extends State<ErrorScreen> {
  @override
  void initState() {
    super.initState();
    HapticFeedback.mediumImpact();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.error.message),
          IconButton(
              onPressed: widget.onPressed,
              icon: const Icon(CupertinoIcons.restart))
        ],
      ),
    );
  }
}
