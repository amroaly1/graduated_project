import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';
import 'package:graduate_project/features/dictionary/manager/sign_dictionary/sign_dictionary_cubit.dart';
import 'package:graduate_project/features/dictionary/manager/sign_dictionary/sign_dictionary_state.dart';
import 'package:graduate_project/features/dictionary/presentation/widget/custom_card.dart';

class CustomCardCharacterAndWord extends StatelessWidget {
  const CustomCardCharacterAndWord({
    super.key,
    required this.myKey,
    required this.words,
  });
  final String myKey;
  final List<DictionaryItemModel> words;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: HeightManager.h10,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.only(top: HeightManager.h10),
          child: Text(
            myKey,
            style: TextStyleManager.medium20(
              color: ColorManager.black1,
            ),
            textAlign: TextAlign.start,
          ),
        ),
        Column(
          spacing: HeightManager.h10,
          children: List.generate(words.length, (index) {
            return BlocBuilder<SignDictionaryCubit, SignDictionaryState>(
              builder: (context, state) {
                return CustomCard(
                  word: words[index],
                  onPressed: () => SignDictionaryCubit.get(context)
                      .changeFavoriteOfItem(words[index].id),
                );
              },
            );
          }),
        ),
      ],
    );
  }
}
