import 'package:get/get.dart';
import 'package:newdictionaryapp/db/model/search_datas/data_model.dart';

//___Create a controller that will manage the tab selection and colors___

class ColorController extends GetxController {
  final selectedIndex = 0.obs;
  RxList searchList = [].obs;

  void setIndex(int index) {
    selectedIndex.value = 0;
  }

}

