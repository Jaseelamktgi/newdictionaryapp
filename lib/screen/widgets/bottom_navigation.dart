import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            color: Colors.blue,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.history,
                      color: Colors.white,
                      size: 26,
                    )),
                Container(
                  height: 55,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextFormField(
                    // controller: searchController,
                    onFieldSubmitted: (value) {
                      // print("value $value");
                      setState(() {
                        // searchWord = value;
                        // print(searchWord);
                      });
                    },
                    // onChanged: (value) {
                    //   // filterSearchResults(value);
                    //   print('cliked');
                    //   print(searchController.text); // for accessing text inside searchcontroller
                    //   setState(() {
                    //     print('value $value');
                    //     print('value  $searchWord');
                    //   });
                    // },
                    decoration: InputDecoration(
                        hintText: 'type english word...',
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(12),
                        hintStyle: TextStyle(
                            color: Color.fromARGB(
                          255,
                          168,
                          165,
                          165,
                        ))),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 26,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
