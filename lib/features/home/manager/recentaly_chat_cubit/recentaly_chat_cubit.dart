import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/home/data/model/sign_gpt_home_response.dart';
import 'package:graduate_project/features/home/data/repo/get_sign_gpt_repo.dart';
import 'package:graduate_project/features/signGPT/data/model/chat_model.dart';
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

  late List<List<Messages>> messages;

  SignGPTHomeResponse? signGPTHomeResponse;

  late List<String> error;

  void init() async {
    error = [
      "",
      "",
    ];
    messages = [
      [],
      [],
    ];
    emit(RecentlyChatLoadingState());
    await Future.wait([getRecentlyChatSIgnGpt(), getRecentlyChatBridge()]);
    emit(RecentlyChatSuccessState());
  }

  int currentIndex = 0;
  void changeCurrentIndex(int index) {
    currentIndex = index;

    emit(RecentalyChatChangeCurrentIndex());
  }

  final GetSignGptRepo repo;

  Future<void> getRecentlyChatSIgnGpt() async {
    var result = await repo.getRecentlyChatSIgnGpt();
    result.fold((l) {
      error[1] = l;
      emit(RecentlyChatErrorState(errMessage: l));
    }, (r) {
      signGPTHomeResponse = r;

      messages[1].addAll([
        Messages(
          role: "user",
          content: r.userPrompt,
          timestamp: r.userTimestamp,
        ),
        Messages(
          role: "assistant",
          content: r.assistantResponse,
          timestamp: r.assistantTimestamp,
        ),
      ]);
    });
  }

  Future<void> getRecentlyChatBridge() async {
    var result = await repo.getRecentlyChatBridge();
    result.fold((l) {
      error[0] = l;
      emit(RecentlyChatErrorState(errMessage: l));
    }, (r) {
      messages[0].addAll(r);
    });
  }
}
