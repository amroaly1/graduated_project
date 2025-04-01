import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/features/onboarding/view/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HandTalk',
      theme: ThemeData(
        fontFamily: FontFamilyManger.inter,
        scaffoldBackgroundColor: ColorManager.scaffoldBackground,
        useMaterial3: true,
      ),
      home: const OnBoarding(),
    );
  }
}
