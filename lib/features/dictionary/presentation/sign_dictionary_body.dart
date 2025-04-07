import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/app_bar_of_home_pages.dart';
import 'package:graduate_project/features/dictionary/data/model/word_model.dart';
import 'package:graduate_project/features/dictionary/manager/cubit/sign_dictionary_cubit.dart';
import 'package:graduate_project/features/dictionary/manager/cubit/sign_dictionary_state.dart';
import 'package:graduate_project/features/dictionary/presentation/widget/custom_text_field.dart';

class SignDictionaryBody extends StatelessWidget {
  const SignDictionaryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignDictionaryCubit(),
      child: Builder(builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              AppBarOfHomePages(title: StringManager.signDictionary),
              Padding(
                padding: PaddingManager.paddingHorizontal24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: HeightManager.h20),
                    CustomTextField(
                      onChanged: SignDictionaryCubit.get(context).onchange,
                      controller: SignDictionaryCubit.get(context).controller,
                    ),
                    SizedBox(height: HeightManager.h20),
                    BlocBuilder<SignDictionaryCubit, SignDictionaryState>(
                      builder: (context, state) {
                        if (state is SignDictionarySearch) {
                          return Column(
                            spacing: HeightManager.h10,
                            children: List.generate(
                              SignDictionaryCubit.get(context)
                                  .searchData
                                  .length,
                              (index) => CustomCard(
                                word: SignDictionaryCubit.get(context)
                                    .searchData[index],
                              ),
                            ),
                          );
                        }
                        return Column(
                          children: List.generate(
                            SignDictionaryCubit.get(context).repo.data.length,
                            (index) => CustomCardCharacterAndWord(
                              myKey: SignDictionaryCubit.get(context)
                                  .repo
                                  .data[index]
                                  .char,
                              words: SignDictionaryCubit.get(context)
                                  .repo
                                  .data[index]
                                  .words,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: HeightManager.h10),
            ],
          ),
        );
      }),
    );
  }
}

class CustomCardCharacterAndWord extends StatelessWidget {
  const CustomCardCharacterAndWord({
    super.key,
    required this.myKey,
    required this.words,
  });
  final String myKey;
  final List<WordModel> words;
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
            return CustomCard(word: words[index]);
          }),
        ),
      ],
    );
  }
}

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.word,
  });
  final WordModel word;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignDictionaryCubit, SignDictionaryState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
            // vertical: HeightManager.h10,
            horizontal: WidthManager.w10,
          ),
          decoration: BoxDecoration(
            color: ColorManager.whight,
            borderRadius: BorderRadius.circular(
              RaduisValueManager.r20,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    NavigationManager.push(
                        context: context,
                        screen: ScreenManager.worddetailsview);
                  },
                  child: SizedBox(
                    child: Text(
                      word.word,
                      style: TextStyleManager.light14(),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  word.save = !word.save;
                  SignDictionaryCubit.get(context).saveElement();
                },
                icon: Icon(
                  word.save ? Icons.bookmark : Icons.bookmark_outline,
                  color: ColorManager.primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// class CustomDivider extends StatelessWidget {
//   const CustomDivider({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Divider(
//       color: ColorManager.light4purpleColor,
//     );
//   }
// }
