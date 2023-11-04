// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:newdictionaryapp/screen/widgets/getx.dart';

// class RadioButton extends StatefulWidget {
//   const RadioButton({super.key});

//   @override
//   State<RadioButton> createState() => _RadioButtonState();
// }

// class _RadioButtonState extends State<RadioButton> {
//   int selectedValue = 0;
//   void RadioValueChange(int? value) {
//     setState(() {
//       selectedValue = value!;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final ColorController colorController = Get.put(ColorController());

//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Radio(
//               value: 0,
//               groupValue: selectedValue,
//               onChanged: RadioValueChange,
//               activeColor: colorController.selectedIndex.value == 0
//                   ? Color.fromARGB(255, 59, 156, 236)
//                   : Colors.black,
//             ),
//             Text('StartWith'),
//             Radio(
//               value: 1,
//               groupValue: selectedValue,
//               onChanged: RadioValueChange,
//               activeColor: colorController.selectedIndex.value == 0
//                   ? Color.fromARGB(255, 59, 156, 236)
//                   : Colors.black,
//             ),
//             Text('Contains'),
//             Radio(
//               value: 2,
//               groupValue: selectedValue,
//               onChanged: RadioValueChange,
//               activeColor: colorController.selectedIndex.value == 0
//                   ? Color.fromARGB(255, 59, 156, 236)
//                   : Colors.black,
//             ),
//             Text('EndWith'),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdictionaryapp/db/functions/list_dictionary_data.dart';

//enumeration that defines three possible values for the radio buttons
enum RadioButtonValues { startWith, contains, endsWith }

class RadioButtons extends StatelessWidget {
  final String titleText;
  final Color buttonColor;
  final RadioButtonValues value;

  const RadioButtons({
    super.key,
    required this.titleText,
    required this.buttonColor,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(
        titleText,
      ),
      value: value,
      groupValue: selectedButtonValue.value,
      onChanged: (value) {
        selectedButtonValue.value = value!;
        buttonColor == Colors.blue
            ? allEnglishWordsList()
            : allMalayalamWordsList();
      },
    );
  }
}
