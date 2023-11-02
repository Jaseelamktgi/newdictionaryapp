import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newdictionaryapp/db/model/search_datas/data_model.dart';
import 'package:newdictionaryapp/screen/widgets/getx.dart';

final Box<DictionaryModel> dictionaryBox = Hive.box('data_box');
ColorController colorController = Get.put(ColorController());

Future<void> filterData(String searchText) async {
  //  // Checking if the user entered text contains in dictionaryBox
  final result = dictionaryBox.values
      .where(
          (element) => element.englishWord.toLowerCase().contains(searchText))
      .toList();

      // print('result of 1==========${result[1].englishWord}');
            print('result of 1==========${result}');


  // Extract English words from the result list
  final englishWords = result.map((model) => model.englishWord).toList();


  // Adding individual English words to searchList
  // colorController.searchList.assignAll(englishWords);


  colorController.searchList.value.add(result);
  // print('Result ======   ${colorController.searchList.value[inz]}');
}
