import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/home/data/model/sign_gpt_home_response.dart';
import 'package:graduate_project/features/home/data/repo/get_sign_gpt_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'recentaly_chat_state.dart';

class RecentalyChatCubit extends Cubit<RecentalyChatState> {
  RecentalyChatCubit(this.repo) : super(RecentalyChatInitial());

  static RecentalyChatCubit get(context) => BlocProvider.of(context);

  List<String> list = [
    "Bridge Chats",
    "SignGPT Chats",
  ];

  void init() {
    getRecentlyChatSIgnGpt();
  }

  int currentIndex = 0;
  void changeCurrentIndex(int index) {
    currentIndex = index;

    emit(RecentalyChatChangeCurrentIndex());
  }

  final GetSignGptRepo repo;

  SignGPTHomeResponse? signGPTHomeResponse;

  void getRecentlyChatSIgnGpt() async {
    emit(RecentlyChatLoadingState());
    var result = await repo.getRecentlyChatSIgnGpt();
    result.fold((l) => emit(RecentlyChatErrorState(errMessage: l)), (r) {
      signGPTHomeResponse = r;
      emit(RecentlyChatSuccessState());
    });
  }
}
