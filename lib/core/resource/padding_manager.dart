import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';

abstract class PaddingManager {
  static EdgeInsets paddingHorizontal16 = EdgeInsets.symmetric(
    horizontal: WidthManager.w16,
  );
  static EdgeInsets paddingHorizontal46 = EdgeInsets.symmetric(
    horizontal: WidthManager.w46,
  );
  static EdgeInsets paddingAuthBody19 = EdgeInsets.only(
    left: WidthManager.w19,
    top: HeightManager.h44,
  );
}
