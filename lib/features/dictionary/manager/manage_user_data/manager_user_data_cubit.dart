import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduate_project/core/network/api_keys.dart';
import 'package:graduate_project/core/storage/shared_preference_helper.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'manager_user_data_state.dart';

class ManagerUserDataCubit extends Cubit<ManagerUserDataState> {
  ManagerUserDataCubit() : super(ManagerUserDataInitial()) {
    firstname = cacheHelper.getDataString(key: ApiKeys.firstName) ?? "";
    lastname = cacheHelper.getDataString(key: ApiKeys.lastName) ?? "";
    username = handelEmail(cacheHelper.getDataString(key: ApiKeys.email));
    imageurl = cacheHelper.getDataString(key: ApiKeys.profilePictureUrl);
  }

  static ManagerUserDataCubit get(context) => BlocProvider.of(context);

  late String firstname;
  late String lastname;
  late String username;
  String? imageurl;

  SharedPreferenceHelper cacheHelper = SharedPreferenceHelper();

  String handelEmail(String? email) {
    return email?.split('@').first ?? "";
  }

  void changeData({
    required String newfirstname,
    required String newlastname,
    required String? newiamgeURL,
  }) async {
    firstname = newfirstname;
    lastname = newlastname;
    await cacheHelper.saveData(key: ApiKeys.firstName, value: newfirstname);
    await cacheHelper.saveData(key: ApiKeys.lastName, value: newlastname);
    if (newiamgeURL != null) {
      imageurl = newiamgeURL;
      await cacheHelper.saveData(
        key: ApiKeys.profilePictureUrl,
        value: newiamgeURL,
      );
    }

    emit(ChangeUserData());
  }
}
