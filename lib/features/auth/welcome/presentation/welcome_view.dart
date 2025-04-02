import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/features/auth/welcome/presentation/widget/welcome_body.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          height: DeviceHeightWidthManager.deviceHight(context),
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                ColorManager.light1purpleColor.withValues(alpha: 0.17),
                ColorManager.light2purpleColor.withValues(alpha: 0.77),
                ColorManager.light2purpleColor,
              ],
            ),
          ),
          child: WelcomeBody(),
        ),
      ),
    );
  }
}
