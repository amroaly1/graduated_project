import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/time_manager.dart';

class CustomCircleIndecator extends StatelessWidget {
  const CustomCircleIndecator(
      {super.key, required this.lenght, required this.currentIndex});
  final int lenght;
  final int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: WidthManager.w16,
      children: List.generate(
          lenght, (index) => _indecator(isActive: index == currentIndex)),
    );
  }

  Widget _indecator({bool isActive = false}) {
    return AnimatedContainer(
      duration: TimeManager.mill250,
      height: HeightManager.h12,
      width: WidthManager.w12,
      decoration: BoxDecoration(
        color: isActive
            ? ColorManager.primaryColor
            : ColorManager.lightpurpleColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
