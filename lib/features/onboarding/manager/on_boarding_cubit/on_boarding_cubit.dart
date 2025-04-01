import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/onboarding/data/repo/on_boarding_repo.dart';
import 'package:graduate_project/features/onboarding/manager/on_boarding_cubit/on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInit());

  static OnBoardingCubit get(context) => BlocProvider.of(context);

  OnBoardingRepo repo = OnBoardingRepo();
}
