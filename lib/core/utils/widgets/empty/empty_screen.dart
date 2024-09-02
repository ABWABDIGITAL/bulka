import 'package:bulka/core/utils/widgets/misc/customer_scroll_behaviour.dart';
import 'package:flutter/material.dart';

///MAKE YOU EMPTY SCREEN IMPLEMENT THIS WIDGET

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Empty Screen'),
      ),
    );
  }
}
