import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdictionaryapp/screen/widgets/getx.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int selectedValue = 0;
  void RadioValueChange(int? value) {
    setState(() {
      selectedValue = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorController colorController = Get.put(ColorController());

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 0,
              groupValue: selectedValue,
              onChanged: RadioValueChange,
              activeColor: colorController.selectedIndex.value == 0
                  ? Color.fromARGB(255, 59, 156, 236)
                  : Colors.black,
            ),
            Text('StartWith'),
            Radio(
              value: 1,
              groupValue: selectedValue,
              onChanged: RadioValueChange,
              activeColor: colorController.selectedIndex.value == 0
                  ? Color.fromARGB(255, 59, 156, 236)
                  : Colors.black,
            ),
            Text('Contains'),
            Radio(
              value: 2,
              groupValue: selectedValue,
              onChanged: RadioValueChange,
              activeColor: colorController.selectedIndex.value == 0
                  ? Color.fromARGB(255, 59, 156, 236)
                  : Colors.black,
            ),
            Text('EndWith'),
          ],
        ),
      ],
    );
  }
}
