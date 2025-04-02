import 'package:flutter/material.dart';
import 'package:graduate_project/features/onboarding/manager/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:graduate_project/features/onboarding/view/widget/on_boarding_item.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: OnBoardingCubit.get(context).controller,
      onPageChanged: OnBoardingCubit.get(context).onPageChange,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return OnBoardingItem(
          item: OnBoardingCubit.get(context).repo.list[index],
        );
      },
      itemCount: OnBoardingCubit.get(context).repo.list.length,
    );
  }
}
