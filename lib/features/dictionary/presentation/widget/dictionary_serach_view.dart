import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/constant/constant.dart';
import 'package:graduate_project/core/dependency_injection/di.dart';
import 'package:graduate_project/core/helper/show_snack_bar.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/font_family_manger.dart';
import 'package:graduate_project/core/resource/padding_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/widget/custom_body_no_search_found.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';
import 'package:graduate_project/features/dictionary/manager/dictionary_search/dictionary_search_cubit.dart';
import 'package:graduate_project/features/dictionary/presentation/widget/custom_card.dart';
import 'package:graduate_project/features/dictionary/presentation/widget/custom_text_field.dart';

class DictionarySerachView extends StatelessWidget {
  const DictionarySerachView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: di<DictionarySearchCubit>()..init(),
      child: Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(height: HeightManager.h49),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        NavigationManager.pop(context: context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    Expanded(
                      child: CustomSearchTextField(
                        controller:
                            DictionarySearchCubit.get(context).searchController,
                        onChanged: DictionarySearchCubit.get(context)
                            .onTextFieldChange,
                        autofocus: true,
                      ),
                    ),
                    BlocBuilder<DictionarySearchCubit, DictionarySearchState>(
                      builder: (context, state) {
                        return PopupMenuButton<int>(
                          icon: Icon(Icons.menu),
                          initialValue: DictionarySearchCubit.get(context)
                              .dictionarySearchType,
                          onSelected: DictionarySearchCubit.get(context)
                              .changeDictionarySearchType,
                          itemBuilder: (context) => searchTypeList
                              .map(
                                (item) => PopupMenuItem<int>(
                                  value: item.value,
                                  child: Text(item.title),
                                ),
                              )
                              .toList(),
                        );
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: HeightManager.h20,
                ),
                Expanded(
                  child: Padding(
                    padding: PaddingManager.paddingHorizontal16,
                    child: BlocConsumer<DictionarySearchCubit,
                        DictionarySearchState>(
                      listener: (context, state) {
                        if (state is DictionarySearchAddFavoriteFailing) {
                          showSnackBar(context, message: state.errMessage);
                        }
                      },
                      builder: (context, state) {
                        if (state is DictionarySearchError) {
                          return ErorrBody(
                            message: state.errMessage,
                            fromInterner: state.isFromInternet,
                          );
                        } else if (state is DictionarySearchSuccess) {
                          if (state.data.isEmpty) {
                            return const CutomBodyNoSearchFound();
                          }
                          return SearchDictionaryShowData(data: state.data);
                        }

                        return InitialSerach();
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

class SearchDictionaryShowData extends StatelessWidget {
  const SearchDictionaryShowData({super.key, required this.data});
  final List<DictionaryItemModel> data;
  @override

  /// Return a ListView of CustomCard when the data is not empty, otherwise return
  /// a NoDataReturn widget
  ///
  /// The ListView is built by the data given in the constructor of this widget
  /// and the space between each item is 6 on the vertical

  Widget build(BuildContext context) {
    return data.isEmpty
        ? const NoDataReturn()
        : ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: HeightManager.h6),
                child: CustomCard(
                  word: data[index],
                  onPressed: () => DictionarySearchCubit.get(context)
                      .addFavoriteOrRemove(id: data[index].id),
                ),
              );
            },
          );
  }
}

class NoDataReturn extends StatelessWidget {
  const NoDataReturn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: HeightManager.h20,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringManager.noWordFound,
          style: TextStyleManager.bold24(
            fontFamily: FontFamilyManger.avenirLTStd,
          ),
        ),
        SizedBox(
          height: HeightManager.h100,
        ),
      ],
    );
  }
}

class InitialSerach extends StatelessWidget {
  const InitialSerach({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox();
  }
}

class ErorrBody extends StatelessWidget {
  const ErorrBody(
      {super.key, required this.message, required this.fromInterner});
  final String message;
  final bool fromInterner;

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
            StringManager.searchproblem,
            style: TextStyleManager.light16(
              color: ColorManager.gray2,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: HeightManager.h100,
          ),
        ],
      ),
    );
  }
}
