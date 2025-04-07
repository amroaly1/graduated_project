import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/widget/cutsom_app_bar_of_sub_page.dart';

class AppBarOfHomePages extends StatelessWidget {
  const AppBarOfHomePages({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CutsomAppBarOfSubPage(
            showArrow: false,
            isSpacingBeforeLogo: false,
            title: Text(
              title,
              textAlign: TextAlign.start,
              style: TextStyleManager.black40(),
            ),
          ),
        ],
      ),
    );
  }
}
