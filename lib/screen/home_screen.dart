import 'package:flutter/material.dart';
import 'package:newdictionaryapp/db/model/search_datas/data_model.dart';
import 'package:newdictionaryapp/screen/widgets/bottom_navigation.dart';
import 'package:newdictionaryapp/screen/widgets/drawer.dart';
import 'package:newdictionaryapp/screen/widgets/getx.dart';
import 'package:newdictionaryapp/screen/widgets/radio_buttons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //______Open the Hive box where the data is stored______
  final Box<DictionaryModel> dictionaryBox = Hive.box('data_box');

  final ScrollController _scrollController = ScrollController();

  final ColorController colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    
    print(colorController.selectedIndex.value);


    return DefaultTabController(
      length: 2,
      child: WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          //===================== Appbar =========================
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: colorController.selectedIndex.value == 0
                ? const Color.fromARGB(255, 59, 156, 236)
                : Colors.black,
            title: Obx(()=>
               Text(
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
            bottom: TabBar(
              tabs: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                          color: colorController.selectedIndex.value == 0
                              ? Colors.white
                              : Color.fromARGB(255, 154, 153, 153),
                          borderRadius: BorderRadius.circular(5)),
                      padding: const EdgeInsets.all(10.0),
                      child: Tab(
                          text: colorController.selectedIndex.value == 0
                              ? 'Eng-> മലയാളം'
                              : 'മലയാളം -> Eng')),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                          color: colorController.selectedIndex.value == 0
                              ? Color.fromARGB(255, 154, 153, 153)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.all(10.0),
                      child: Tab(
                        text: 'മലയാളം-> Eng',
                      )),
                ),
              ],
              indicatorSize: TabBarIndicatorSize.tab,
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
                  child: TabBarView(children: [
                    //_____English to Malayalam tab_____
                    ListView.builder(
                      controller:
                          _scrollController, // Assign the scroll controller
                      itemCount: colorController.searchList.length,
                      itemBuilder: (context, index) {
                        // final entry =
                        //     dictionaryBox.getAt(index) as DictionaryModel;
                            final englishWord = colorController.searchList[index];
                            // print('ENGLISH =====${colorController.searchList}');
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            margin: EdgeInsets.all(8),
                            child: ListTile(
                              // title: Text('txt'),
                              title: Text(englishWord),
                              // subtitle: Text(entry.malayalamDefinition),
                            ),
                          ),
                        );
                      },
                    ),

                    //_______Malayalam to English tab_____
                    ListView.builder(
                      controller:
                          _scrollController, // Assign the scroll controller
                      itemCount: dictionaryBox.length,
                      itemBuilder: (context, index) {
                        final entry =
                            dictionaryBox.getAt(index) as DictionaryModel;
                        return GestureDetector(
                          onTap: () {},
                          child: Card(
                            margin: EdgeInsets.all(8),
                            child: ListTile(
                              title: Text(entry.malayalamDefinition),
                              // subtitle: Text(entry.englishWord),
                            ),
                          ),
                        );
                      },
                    ),
                  ]),
                ),
              ),
              BottomNavigation(),
              RadioButton(),
            ],
          ),
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
