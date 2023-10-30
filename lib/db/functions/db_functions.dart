import 'package:hive/hive.dart';
import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:newdictionaryapp/db/model/search_datas/data_model.dart';

//=====function to add data from csv file to hive====

Future<void> loadData() async {
  //_______path to csv file_____
  final String csvData = ('assets/images/dictionary.csv');

  //______loading csv form assets___
  final dictionaryData = await rootBundle.loadString(csvData);

  //_____parse csv data to list _____
  final List<List<dynamic>> csvList = const CsvToListConverter().convert(dictionaryData);
  print('CSV Data: ${csvList[5]}');

  //______new instance of box______
  final Box<DictionaryModel> dictionaryBox = Hive.box<DictionaryModel>('data_box');

  //___add the value to hive by looping through the list___
  for (int i = 1; i < csvList.length; i++) {
    //  print('values of i===${csvList[i][0]}');

    final allEntries = DictionaryModel(
        id: csvList[i][0].toString(),
        englishWord: csvList[i][1].toString(),
        partOfSpeech: csvList[i][2].toString(),
        malayalamDefinition: csvList[i][3].toString());

    //___storing all enteries to data box___
    await dictionaryBox.add(allEntries);

    // print(allEntries);
  }
      print('Length=======${dictionaryBox.length}');

}
