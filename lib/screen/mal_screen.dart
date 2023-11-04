import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdictionaryapp/screen/eng_screen.dart';
import 'package:newdictionaryapp/db/functions/list_dictionary_data.dart';
import 'package:newdictionaryapp/screen/home_screen.dart';

class MalaToEnglishScreen extends StatelessWidget {
  const MalaToEnglishScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        Get.off(
          () => const EngLishToMalaScreen(),
        );
        allDictionaryList.clear();
        allDictionaryDatasMap.clear();
        userSearchInput.value = '';
      },
      child: HomeScreen(
        color: Colors.black,
        appBarTitleText: 'മലയാളം -> English ...',
        searchFieldText: 'മലയാളത്തിൽ ടൈപ്പ് ചെയ്യുക',
        pageRoute: () {
          Get.off(
            () => const EngLishToMalaScreen(),
          );
          allDictionaryList.clear();
          allDictionaryDatasMap.clear();
          userSearchInput.value = '';
        },
        listData: allMalayalamWordsList,
      ),
    );
  }
}
