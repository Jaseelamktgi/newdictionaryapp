import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newdictionaryapp/db/functions/db_function.dart';
import 'package:newdictionaryapp/db/model/search_datas/data_model.dart';
import 'package:newdictionaryapp/screen/eng_screen.dart';
import 'package:newdictionaryapp/screen/home_screen.dart';

Future<void> main() async {
  
  //____Ensure that the Flutter framework is initialized___
  WidgetsFlutterBinding.ensureInitialized();

  //_____initialise hive______
  await Hive.initFlutter();

  //_____register all type adapters_____
  if (!Hive.isAdapterRegistered(DictionaryModelAdapter().typeId)) {
    Hive.registerAdapter(DictionaryModelAdapter());
  }
  
  //____________open box in hive_____
  await Hive.openBox<DictionaryModel>('data_box');

  //______load dictionary data_______
  await loadData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: EngLishToMalaScreen(),
    );
  }
}
