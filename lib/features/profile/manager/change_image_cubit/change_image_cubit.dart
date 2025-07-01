import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'change_image_state.dart';

class ChangeImageCubit extends Cubit<ChangeImageState> {
  ChangeImageCubit() : super(ChangeImageInitial());

  static ChangeImageCubit get(context) => BlocProvider.of(context);

  final ImagePicker _picker = ImagePicker();
  XFile? image;

  void getImageFromGallery() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      emit(ChangeImageSuccess());
    }
  }
}
