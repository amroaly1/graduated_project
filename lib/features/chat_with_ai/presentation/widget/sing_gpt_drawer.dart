import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/font_weight_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';

class SignGPTDrawer extends StatelessWidget {
  const SignGPTDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: WidthManager.w280, // match screenshot width
      backgroundColor: const Color(0xFFEDE5FF), // light purple
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SignGPT Chats',
                    style: TextStyle(
                      fontFamily: FontFamilyManger.avenirLTStd,
                      fontSize: 17,
                      fontWeight: FontWeightManager.bold,
                      color: Color(0xFF4B2D7A), // darker purple text
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: SvgPicture.asset(
                      IconManager.drawerclose,
                      width: WidthManager.w19,
                      height: HeightManager.h18,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for chats...',
                  hintStyle: TextStyle(
                    fontSize: 15,
                    color: ColorManager.color1,
                    fontWeight: FontWeightManager.bold,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFD1C4E9),
                  prefixIcon: SvgPicture.asset(
                    IconManager.searchicon,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      ColorManager.color1,
                      BlendMode.srcIn,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Chats',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: ColorManager.gray21,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Chat list
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ChatTile(title: 'How to Sign “Thank You”?'),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFD1C4E9),
                  foregroundColor: Colors.black87,
                  minimumSize: const Size.fromHeight(48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Start New Chat',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontFamilyManger.avenirLTStd,
                    color: ColorManager.color1,
                    fontWeight: FontWeightManager.semiBold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String title;
  const ChatTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 9,
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        tileColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 13,
            color: ColorManager.color1,
            fontWeight: FontWeightManager.semiBold,
            fontFamily: FontFamilyManger.avenirLTStd,
          ),
        ),
        onTap: () {
          // handle chat tap
        },
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 0),
        dense: true,
      ),
    );
  }
}
