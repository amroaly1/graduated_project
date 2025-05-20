import 'package:graduate_project/features/dictionary/data/model/map_of_character.dart';

class DataFromRepo {
  final List<MapOfCharacter> data;
  final bool canLoading;

  DataFromRepo({
    required this.data,
    required this.canLoading,
  });
}
