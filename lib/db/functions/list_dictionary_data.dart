import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:newdictionaryapp/db/model/search_datas/data_model.dart';
import 'package:newdictionaryapp/screen/widgets/radio_buttons.dart';

// final Box<DictionaryModel> dictionaryBox = Hive.box('data_box');
// ColorController colorController = Get.put(ColorController());

// Future<void> filterData(String searchText) async {
//   //  // Checking if the user entered text contains in dictionaryBox
//   final result = dictionaryBox.values
//       .where(
//           (element) => element.englishWord.toLowerCase().contains(searchText))
//       .toList();

//   print(result);

//   colorController.searchList.add(result);

// }

final Box<DictionaryModel> dictionaryBox = Hive.box('data_box');

var allDictionaryList = <DictionaryModel>[].obs;
Rx<RadioButtonValues> selectedButtonValue = RadioButtonValues.contains.obs;
var userSearchInput = ''.obs;
var allDictionaryDatasMap = <String, List<dynamic>>{}.obs;

// fetching the data from hive
// sorting with regex
// adding to the list and showing to the use
void allEnglishWordsList() {
  RegExp regEx;
  switch (selectedButtonValue.value) {
    case RadioButtonValues.startWith:
      regEx = RegExp('^${userSearchInput.value}');
      break;
    case RadioButtonValues.endsWith:
      regEx = RegExp('${userSearchInput.value}\$');
      break;
    default:
      regEx = RegExp(userSearchInput.value);
  }
  allDictionaryList.clear();
  allDictionaryDatasMap.clear();

  var result = dictionaryBox.values
      .where(
        (element) => element.englishWord.toLowerCase().contains(regEx),
      )
      .toList();
  allDictionaryList.value = result;

  var dictionaryKeys = allDictionaryDatasMap.keys.toSet();
  for (var element in allDictionaryList) {
    if (dictionaryKeys.contains(element.englishWord)) {
      allDictionaryDatasMap[element.englishWord]?.add({
        'type': element.partOfSpeech,
        'meaning': element.malayalamDefinition
      });
    } else {
      allDictionaryDatasMap[element.englishWord] = [
        {'type': element.partOfSpeech, 'meaning': element.malayalamDefinition}
      ];
    }
  }
}

void allMalayalamWordsList() {
  RegExp regEx;
  switch (selectedButtonValue.value) {
    case RadioButtonValues.startWith:
      regEx = RegExp('^${userSearchInput.value}');
      break;
    case RadioButtonValues.endsWith:
      regEx = RegExp('${userSearchInput.value}\$');
      break;
    default:
      regEx = RegExp(userSearchInput.value);
  }
  allDictionaryList.clear();
  allDictionaryDatasMap.clear();
  var result = dictionaryBox.values
      .where(
        (element) => element.malayalamDefinition.contains(regEx),
      )
      .toList();
  allDictionaryList.value = result;
  if (userSearchInput.value == '') {
    allDictionaryList.clear();
    allDictionaryDatasMap.clear();
  }

  var dictionaryKeys = allDictionaryDatasMap.keys.toSet();
  for (var element in allDictionaryList) {
    if (dictionaryKeys.contains(element.malayalamDefinition)) {
      allDictionaryDatasMap[element.malayalamDefinition]?.add({
        'type': element.partOfSpeech,
        'meaning': element.englishWord,
      });
    } else {
      allDictionaryDatasMap[element.malayalamDefinition] = [
        {
          'type': element.partOfSpeech,
          'meaning': element.englishWord,
        }
      ];
    }
  }
}
