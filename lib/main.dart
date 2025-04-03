import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/device_height_width_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/route/route_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        DeviceHeightWidthManager.designWidth,
        DeviceHeightWidthManager.designHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HandTalk',
        theme: ThemeData(
          fontFamily: FontFamilyManger.hvDTrialBrandonGrotesque,
          scaffoldBackgroundColor: ColorManager.scaffoldBackground,
          useMaterial3: true,
        ),
        initialRoute: ScreenManager.onBoardingView,
        onGenerateRoute: RouteManager.generateRoute,
      ),
    );
  }
}
