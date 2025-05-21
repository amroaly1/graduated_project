import 'package:flutter/material.dart';
import 'package:graduate_project/core/resource/color_manager.dart';
import 'package:graduate_project/core/resource/distance_manager.dart';
import 'package:graduate_project/core/resource/text_style_manager.dart';
import 'package:graduate_project/core/route/navigation_manager.dart';
import 'package:graduate_project/core/route/screen_manager.dart';
import 'package:graduate_project/features/dictionary/data/model/dictionary_item_model.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.word,
  });
  final DictionaryItemModel word;
  @override
  Widget build(BuildContext context) {
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
                    screen: ScreenManager.worddetailsview,
                    arguments: word);
              },
              child: SizedBox(
                child: Text(
                  word.gloss,
                  style: TextStyleManager.light14(),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              word.isFavorite ? Icons.bookmark : Icons.bookmark_outline,
              color: ColorManager.primaryColor,
            ),
          ),
        ],
      ),
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
