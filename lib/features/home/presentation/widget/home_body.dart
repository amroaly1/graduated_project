import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/widget/app_bar_of_home_pages.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBarOfHomePages(title: StringManager.home),
      ],
    );
  }
}
