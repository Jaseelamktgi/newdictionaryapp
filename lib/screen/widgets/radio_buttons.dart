import 'package:flutter/material.dart';

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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 0,
              groupValue: selectedValue,
              onChanged: RadioValueChange,
            ),
            Text('StartWith'),
            Radio(
              value: 1,
              groupValue: selectedValue,
              onChanged: RadioValueChange,
            ),
            Text('Contains'),
            Radio(
              value: 2,
              groupValue: selectedValue,
              onChanged: RadioValueChange,
            ),
            Text('EndWith'),
          ],
        ),
      ],
    );
  }
}
