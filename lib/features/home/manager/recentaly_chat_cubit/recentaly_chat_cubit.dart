import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'recentaly_chat_state.dart';

class RecentalyChatCubit extends Cubit<RecentalyChatState> {
  RecentalyChatCubit() : super(RecentalyChatInitial());

  static RecentalyChatCubit get(context) => BlocProvider.of(context);

  List<String> list = [
    "Bridge Chats",
    "SignGPT Chats",
  ];

  int currentIndex = 0;
  void changeCurrentIndex(int index) {
    currentIndex = index;
    emit(RecentalyChatChangeCurrentIndex());
  }
}
