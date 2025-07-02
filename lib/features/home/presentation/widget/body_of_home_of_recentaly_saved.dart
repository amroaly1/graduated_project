import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/features/home/presentation/widget/custom_card_of_recentaly_saved_item_home.dart';

class BodyOfHomeRecentalySaved extends StatelessWidget {
  const BodyOfHomeRecentalySaved({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HeightManager.h55,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return CustomCardOfRecentalySavedItemHome(
            time: "Today",
            title: "help-me",
            image: IconManager.recentalysavedpersonpng,
            isSvg: false,
          );
        },
      ),
    );
  }
}
