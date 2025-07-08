import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/font_weight_manager.dart';
import 'package:graduate_project/core/resource/icon_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/chat_with_ai/manager/cubit/chat_list_view_cubit.dart';
import 'package:graduate_project/features/chat_with_ai/presentation/widget/chat_wit_ai_body_view.dart';
import 'package:graduate_project/features/chat_with_ai/presentation/widget/sing_gpt_drawer.dart';

class ChatWithAiView extends StatelessWidget {
  const ChatWithAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatListViewCubit()..init(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorManager.primaryColorlight,
          title: Text(
            StringManager.signGPT,
            style: TextStyleManager.medium20(
              color: ColorManager.gray9,
              fontFamily: FontFamilyManger.avenirLTStd,
              fontWeight: FontWeightManager.semiBold,
            ),
          ),
          centerTitle: true,
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset(IconManager.settingsigngpt),
            );
          }),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                IconManager.addnewsigngpt,
              ),
            ),
          ],
        ),
        body: ChatWitAiBodyView(),
        drawer: SignGPTDrawer(),
      ),
    );
  }
}
