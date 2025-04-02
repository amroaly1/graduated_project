import 'package:flutter/material.dart';

abstract class ShadowManager {
  static Shadow textShadow = Shadow(
    offset: Offset(0, 3.3),
    blurRadius: 4,
    color: Colors.black.withValues(alpha: 0.25),
  );
}
