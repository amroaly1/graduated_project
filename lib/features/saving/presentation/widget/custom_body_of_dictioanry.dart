import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/saving/manager/dictionary_saving_cubit/dictionary_saving_cubit.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_card_of_dictaionry.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_failing_body.dart';
import 'package:graduate_project/features/saving/presentation/widget/custom_loading_body.dart';

class CustomBodyOfDictioanry extends StatelessWidget {
  const CustomBodyOfDictioanry({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DictionarySavingCubit, DictionarySavingState>(
      builder: (context, state) {
        if (state is DictionarySavingFailing) {
          return CustomFailingBody(error: state.errMessage);
        } else if (state is DictionarySavingLoading) {
          return CustomLoadingBody();
        }
        return ListView.builder(
          itemCount: DictionarySavingCubit.get(context).list.length,
          itemBuilder: (context, index) => CustomCardOfDictaionry(
            item: DictionarySavingCubit.get(context).list[index],
          ),
        );
      },
    );
  }
}
