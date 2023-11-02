import 'package:hive/hive.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:newdictionaryapp/db/model/search_datas/data_model.dart';

//=====function to add data from csv file to hive====

Future<void> loadData() async {
  //______path to csv file____
  final String csvData = ('assets/images/dictionary.csv');

  //_____loading csv form assets__
  final dictionaryData = await rootBundle.loadString(csvData);

  //_____parse csv data to list _____
  final List<List<dynamic>> csvList = const CsvToListConverter()
      .convert(dictionaryData, fieldDelimiter: ',', eol: '\n');

  //_____new instance of box_____
  final Box<DictionaryModel> dictionaryBox =
      Hive.box<DictionaryModel>('data_box');

  //__add the value to hive by looping through the list__
  if (dictionaryBox.isEmpty) {
    for (int i = 1; i < csvList.length; i++) {
      final allEntries = DictionaryModel(
          id: csvList[i][0].toString(),
          englishWord: csvList[i][1].toString(),
          partOfSpeech: csvList[i][2].toString(),
          malayalamDefinition: csvList[i][3].toString());

      //__storing all enteries to data box__
      await dictionaryBox.add(allEntries);
    }
  } else {}
  // print(dictionaryBox.length);
}


