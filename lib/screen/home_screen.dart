import 'package:flutter/material.dart';
import 'package:newdictionaryapp/db/functions/list_dictionary_data.dart';
import 'package:newdictionaryapp/db/model/search_datas/data_model.dart';
import 'package:newdictionaryapp/screen/widgets/drawer.dart';
import 'package:newdictionaryapp/screen/widgets/getx.dart';
import 'package:newdictionaryapp/screen/widgets/radio_buttons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  final Color color;
  final String appBarTitleText;
  final String searchFieldText;
  final VoidCallback pageRoute;
  final Function listData;

  HomeScreen({super.key,
  required this.color,
  required this.pageRoute,
  required this.listData,
  required this.appBarTitleText, 
  required this.searchFieldText
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //______Open the Hive box where the data is stored______
  final Box<DictionaryModel> dictionaryBox = Hive.box('data_box');
  //_____Search field controller____
  TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ColorController colorController = Get.put(ColorController());

  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    print(colorController.selectedIndex.value);

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        //===================== Appbar =========================
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: colorController.selectedIndex.value == 0
              ? const Color.fromARGB(255, 59, 156, 236)
              : Colors.black,
          title: Obx(
            () => Text(
              colorController.selectedIndex.value == 0
                  ? 'English -> മലയാളം... '
                  : 'മലയാളം -> English...',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          actions: const [
            Icon(
              Icons.share,
              color: Colors.amberAccent,
            ),
          ],

          //===================== TabBar =====================
          // bottom: TabBar(
            // controller: tabController,
            // onTap: (int index) {
            //   setState(() {
            //     colorController.selectedIndex.value = index;
                
            //   });
            //   widget.pageRoute;
            // },
            // tabs: [
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Container(
              //       height: 44,
              //       decoration: BoxDecoration(
              //           color: colorController.selectedIndex.value == 0
              //               ? Colors.white
              //               : Color.fromARGB(255, 154, 153, 153),
              //           borderRadius: BorderRadius.circular(5)),
              //       padding: const EdgeInsets.all(10.0),
              //       child: Tab(
              //           text: colorController.selectedIndex.value == 0
              //               ? 'Eng-> മലയാളം'
              //               : 'മലയാളം -> Eng')),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(10.0),
              //   child: Container(
              //       height: 44,
              //       decoration: BoxDecoration(
              //           color: colorController.selectedIndex.value == 0
              //               ? Color.fromARGB(255, 154, 153, 153)
              //               : Colors.white,
              //           borderRadius: BorderRadius.circular(5)),
              //       padding: EdgeInsets.all(10.0),
              //       child: Tab(
              //         text: colorController.selectedIndex.value == 0
              //             ? 'മലയാളം -> Eng'
              //             : 'Eng-> മലയാളം',
              //       )),
              // ),
            // ],
          // ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(35),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        onPressed: widget.color == Colors.blue ? () {} : widget.pageRoute,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Eng->മലയാളം',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: ElevatedButton(
                        onPressed: widget.color == Colors.black ? () {} : widget.pageRoute,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                        ),
                        child: const Text(
                          'മലയാളം->Eng',
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ),

        //===================== Drawer =====================
        drawer: DrawerWidget(),

        //===================== body =======================
        body: Column(
          children: [
            Expanded(
              child: Container(
                height: 200,
                child: Obx(
                  ()=> ListView.builder(
                    itemCount: allDictionaryDatasMap.length,
                    itemBuilder: (context, index) {
                      final data = allDictionaryDatasMap.keys.elementAt(index);
                      return GestureDetector(
                        onTap: () {
                          
                          //show definition
                        },
                        child: Card(
                          margin: const EdgeInsets.all(4),
                          elevation: 1,
                          child: ListTile(
                            title: Text(data),
                          ),
                        ),
                      );
                    }),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    color: colorController.selectedIndex.value == 0
                        ? Colors.blue
                        : Colors.black,
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
                            controller: _searchController,
                            // onChanged: (inputText) => filterData(inputText),
                            onChanged: (value) {
                                    userSearchInput.value = value;
                                    widget.listData();
                            },
                            decoration: InputDecoration(
                                hintText:
                                    colorController.selectedIndex.value == 0
                                        ? 'type english word...'
                                        : 'മലയാളത്തിൽ ടൈപ്പുചെയ്യുക',
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
            ),

          //selected radio value used to determine the filtering criteria
            Row(children: [
          Flexible(
            child: RadioButtons(
              titleText: 'StartWith',
              value:RadioButtonValues.startWith,
              buttonColor:widget.color,                
            ),
          ),
          Flexible(
            child: RadioButtons(
              titleText: 'Contains',
              buttonColor:widget.color,                

              value: RadioButtonValues.contains,
            ),
          ),
          Flexible(
            child: RadioButtons(
              titleText: 'EndsWith',
              buttonColor: widget.color,                
              value: RadioButtonValues.endsWith,
             
            ),
          ),
        ]),
          ],
        ),
      ),
    );
  }

  //_____To show a confirmation dialog when the back button on the phone is pressed_____
  Future<bool> _onBackPressed() async {
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text("Exit Warning"),
          content: Text("Are you sure you want to exit?"),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              onPressed: () {
                Navigator.of(context).pop(false); // No, do not exit
              },
              child: Text(
                "No",
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).pop(true); // Yes, exit
              },
              child: Text("Yes", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }
}
