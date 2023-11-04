import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdictionaryapp/screen/home_screen.dart';
import 'package:newdictionaryapp/screen/mal_screen.dart';
import 'package:newdictionaryapp/db/functions/list_dictionary_data.dart';

class EngLishToMalaScreen extends StatelessWidget {
  const EngLishToMalaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {

        //Navigate to mal to eng screen when drag
        Get.off(
          () => const MalaToEnglishScreen(),
        );
        //clear all datas
        allDictionaryList.clear();
        allDictionaryDatasMap.clear();
        userSearchInput.value = '';
      },

      child: HomeScreen(
        color: Colors.blue,
        appBarTitleText: 'English -> മലയാളം ...',
        searchFieldText: 'Type English Word',
        pageRoute: () {
          Get.off(
            () => const MalaToEnglishScreen(),
          );
          allDictionaryList.clear();
          allDictionaryDatasMap.clear();
          userSearchInput.value = '';
        },
        //list of eng words disply on screen
        listData: allEnglishWordsList,
      ),
    );
  }
}
