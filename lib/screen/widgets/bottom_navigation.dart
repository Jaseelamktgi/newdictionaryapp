// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:hive/hive.dart';
// import 'package:newdictionaryapp/db/functions/list_dictionary_data.dart';
// import 'package:newdictionaryapp/db/model/search_datas/data_model.dart';
// import 'package:newdictionaryapp/screen/widgets/getx.dart';

// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({super.key});

//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }

// class _BottomNavigationState extends State<BottomNavigation> {
//   //_____Search field controller____
//   TextEditingController _searchController = TextEditingController();
//   final ColorController colorController = Get.put(ColorController());


//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(0),
//           child: Container(
//             color: colorController.selectedIndex.value == 0
//                 ? Colors.blue
//                 : Colors.black,
//             height: 70,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.history,
//                       color: Colors.white,
//                       size: 26,
//                     )),
//                 Container(
//                   height: 55,
//                   width: 200,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(15)),
//                   child: TextFormField(
//                     controller: _searchController,
//                     onChanged: (inputText) => filterData(inputText),
//                     decoration: InputDecoration(
//                         hintText: colorController.selectedIndex.value == 0
//                             ? 'type english word...'
//                             : 'മലയാളത്തിൽ ടൈപ്പുചെയ്യുക',
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.all(12),
//                         hintStyle: TextStyle(
//                             color: Color.fromARGB(
//                           255,
//                           168,
//                           165,
//                           165,
//                         ))),
//                   ),
//                 ),
//                 IconButton(
//                     onPressed: () {},
//                     icon: Icon(
//                       Icons.mic,
//                       color: Colors.white,
//                       size: 26,
//                     ))
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
