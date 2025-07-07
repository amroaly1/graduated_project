import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/core/widget/app_bar_of_home_pages.dart';
import 'package:graduate_project/features/dictionary/manager/sign_dictionary/sign_dictionary_cubit.dart';
import 'package:graduate_project/features/dictionary/manager/sign_dictionary/sign_dictionary_state.dart';
import 'package:graduate_project/features/dictionary/presentation/widget/custom_character_and_word.dart';
import 'package:graduate_project/features/dictionary/presentation/widget/custom_text_field.dart';
import 'package:graduate_project/features/dictionary/presentation/widget/sign_dictionary_loading.dart';

class SignDictionaryBody extends StatelessWidget {
  const SignDictionaryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: SignDictionaryCubit.get(context).controllerScroll,
      slivers: [
        SliverToBoxAdapter(
          child: AppBarOfHomePages(title: StringManager.signDictionary),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: PaddingManager.paddingHorizontal16,
            child: Column(
              children: [
                SizedBox(height: HeightManager.h20),
                InkWell(
                  onTap: () {
                    NavigationManager.push(
                      context: context,
                      screen: ScreenManager.dictionarySearchView,
                    );
                  },
                  borderRadius: BorderRadius.circular(
                    RaduisValueManager.r20,
                  ),
                  child: CustomSearchTextField(
                    // onChanged: SignDictionaryCubit.get(context).onchange,
                    // controller: SignDictionaryCubit.get(context).controller,
                    enable: false,
                    // onTap: () {

                    // },
                  ),
                ),
              ],
            ),
          ),
        ),
        // SliverToBoxAdapter(child: SizedBox(height: HeightManager.h20)),
        BlocConsumer<SignDictionaryCubit, SignDictionaryState>(
          listener: (context, state) {
            if (state is SignDictionaryGetAllDataFailing) {
              showSnackBar(context, message: state.errorMessage);
            }
          },
          builder: (context, state) {
            if (state is SignDictionaryGetAllDataFirstFailing) {
              return SliverFillRemaining(
                child: SignDictionaryFailing(
                  message: state.errorMessage,
                  fromInterner: state.fromInternet,
                ),
              );
            }
            if (state is SignDictionaryGetAllDataLoading) {
              return SliverFillRemaining(
                child: Padding(
                  padding: PaddingManager.paddingHorizontal16,
                  child: SignDictionaryLoading(),
                ),
              );
            }

            return SliverList.builder(
              itemBuilder: (context, index) {
                if (index == SignDictionaryCubit.get(context).data.length) {
                  return Padding(
                    padding: EdgeInsets.only(
                        top: HeightManager.h15, bottom: HeightManager.h70),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return Padding(
                  padding: PaddingManager.paddingHorizontal16,
                  child: CustomCardCharacterAndWord(
                    myKey: SignDictionaryCubit.get(context).data[index].key,
                    words: SignDictionaryCubit.get(context).data[index].data,
                  ),
                );
              },
              itemCount: SignDictionaryCubit.get(context).canLoadMore
                  ? SignDictionaryCubit.get(context).data.length + 1
                  : SignDictionaryCubit.get(context).data.length,
            );
          },
        ),
        SliverToBoxAdapter(child: SizedBox(height: HeightManager.h20)),
      ],
    );
  }
}

class SignDictionaryFailing extends StatelessWidget {
  const SignDictionaryFailing(
      {super.key, required this.fromInterner, required this.message});
  final bool fromInterner;
  final String message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PaddingManager.paddingHorizontal16,
      child: Column(
        spacing: HeightManager.h12,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            fromInterner
                ? Icons.wifi_off_outlined
                : Icons.warning_amber_rounded,
            size: HeightManager.h160,
            // color: fromInterner ? ColorManager.black : ColorManager.red,
          ),
          Text(
            message,
            style: TextStyleManager.bold20(
              color: ColorManager.black,
              fontFamily: FontFamilyManger.avenirLTStd,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            StringManager.getDictionaryDataProblem,
            style: TextStyleManager.light16(
              color: ColorManager.gray2,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: HeightManager.h20,
          ),
          Padding(
            padding: PaddingManager.paddingHorizontal46,
            child: IconButton(
              onPressed: () {
                SignDictionaryCubit.get(context).getData();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.blue,
              ),
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: WidthManager.w6,
                children: [
                  Icon(Icons.refresh),
                  Text(
                    "try again",
                    style: TextStyleManager.bold16(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: HeightManager.h100,
          ),
        ],
      ),
    );
  }
}
