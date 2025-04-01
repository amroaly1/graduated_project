import 'package:graduate_project/core/resource/image_manager.dart';
import 'package:graduate_project/core/resource/string_manager.dart';
import 'package:graduate_project/features/onboarding/data/model/on_boarding_model.dart';

class OnBoardingRepo {
  OnBoardingRepo._();
  static OnBoardingRepo? _instance;

  factory OnBoardingRepo() {
    _instance ??= OnBoardingRepo._();

    return _instance!;
  }

  List<OnBoardingModel> list = [
    OnBoardingModel(
      image: ImageManager.onBoardingImage1,
      title: StringManager.onBoardingTitle1,
      subTitle: StringManager.onBoardingSubTitle1,
    ),
    OnBoardingModel(
      image: ImageManager.onBoardingImage2,
      title: StringManager.onBoardingTitle2,
      subTitle: StringManager.onBoardingSubTitle2,
    ),
    OnBoardingModel(
      image: ImageManager.onBoardingImage3,
      title: StringManager.onBoardingTitle3,
      subTitle: StringManager.onBoardingSubTitle3,
    ),
  ];
}
