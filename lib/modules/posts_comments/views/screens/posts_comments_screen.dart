import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';

class PostsCommentsScreen extends StatelessWidget {
  const PostsCommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
