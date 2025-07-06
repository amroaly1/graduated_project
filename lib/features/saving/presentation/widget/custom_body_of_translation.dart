import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/saving/manager/translation_saving/trsanlation_saving_cubit.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_card_of_translation.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_failing_body.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_loading_body.dart';

class CustomBodyOfTranslation extends StatelessWidget {
  const CustomBodyOfTranslation({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrsanlationSavingCubit, TrsanlationSavingState>(
      listener: (context, state) {
        if (state is TrsanlationSavingDeleteErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is TrsanlationSavingErrorState) {
          return CustomFailingBody(error: state.errMessage);
        } else if (state is TrsanlationSavingLoadingState) {
          return CustomLoadingBody();
        }
        return ListView.builder(
          itemCount: TrsanlationSavingCubit.get(context)
                  .translationSavingModel
                  ?.translations
                  .length ??
              0,
          itemBuilder: (context, index) => CustomCardOfTranslation(
            item: TrsanlationSavingCubit.get(context)
                .translationSavingModel!
                .translations[index],
          ),
        );
      },
    );
  }
}
