import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/features/chat_with_ai/data/model/list_of_chat_model.dart';
import 'package:graduate_project/features/chat_with_ai/data/repo/get_all_chat_repo.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'get_all_chat_state.dart';

class GetAllChatCubit extends Cubit<GetAllChatState> {
  GetAllChatCubit(this.repo) : super(GetAllChatInitial());

  static GetAllChatCubit get(context) => BlocProvider.of(context);

  final GetAllChatRepo repo;

  late ListOfChatModel chatModel;

  init() {
    getAllChat();
  }

  void getAllChat() async {
    emit(GetAllChatLoading());
    var result = await repo.getAllChat();
    result.fold((l) => emit(GetAllChatFailing(errMessage: l)), (r) {
      chatModel = r;
      emit(GetAllChatSuccess());
    });
  }

  void deleteChat({required int chatId}) async {
    emit(GetAllChatDeleteOnLoading());
    var result = await repo.deleteChat(chatId: chatId);
    result.fold((l) => emit(GetAllChatDeleteOnFailing(errMessage: l)), (r) {
      chatModel.chatItems.removeWhere((element) => element.chatId == chatId);
      emit(GetAllChatDeleteOnSuccess());
    });
  }
}
