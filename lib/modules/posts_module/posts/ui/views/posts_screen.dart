import 'package:bulka/core/shared/widgets/post_card_widget.dart';
import 'package:bulka/modules/home/ui/widgets/home_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppbarWidget(),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return const PostCardWidget().animate().fade(delay: (index * 50).ms);
        },
        itemCount: 10,
      ),
    );
  }
}
