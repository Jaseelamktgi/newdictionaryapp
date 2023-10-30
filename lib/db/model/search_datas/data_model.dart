import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'data_model.g.dart';


@HiveType(typeId: 1)
class DictionaryModel{
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String englishWord;

  @HiveField(2)
  final String partOfSpeech;

  @HiveField(3)
  final String malayalamDefinition;

  DictionaryModel({
    
    required this.id,
    required this.englishWord,
    required this.partOfSpeech,
    required this.malayalamDefinition,
  });
}