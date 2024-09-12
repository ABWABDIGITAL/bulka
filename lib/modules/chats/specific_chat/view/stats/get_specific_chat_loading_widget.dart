import 'package:flutter/material.dart';

class GetSpecificChatLoadingWidget extends StatelessWidget {
  const GetSpecificChatLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
