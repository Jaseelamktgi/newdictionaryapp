import 'package:flutter/material.dart';
import 'package:newdictionaryapp/db/model/search_datas/data_model.dart';
import 'package:newdictionaryapp/screen/widgets/bottom_navigation.dart';
import 'package:newdictionaryapp/screen/widgets/drawer.dart';
import 'package:newdictionaryapp/screen/widgets/radio_buttons.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

final Box<DictionaryModel> showData = Hive.box('myDataBox');
final dataList = showData.values.toList();

class HomeScreen extends StatefulWidget {

  HomeScreen({super.key});

  int selectedIndex = 0;
  
  @override
  State<HomeScreen> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //_______________________Appbar________________________
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 59, 156, 236),
          title: Text(
            'English -> മലയാളം... ',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          actions: const [
            Icon(
              Icons.share,
              color: Colors.amberAccent,
            ),
          ],

          //______________________TabBar_______________________
          bottom: TabBar(
            onTap: (index) {
              setState(() {
                // selectedIndex = index;
              });
            },
            tabs: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.all(10.0),
                    child: Tab(text: 'Eng-> മലയാളം')),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 154, 153, 153),
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
        

        //________________________Drawer________________________
        drawer: DrawerWidget(),

        //_________________________body_________________________
       body: Column(
         children: [
           ListView.separated(
            itemBuilder:(cntx, index) {
              final dicData = dataList[index];
              print(dicData.englishWord);
              return ListTile(
                title: Text(dicData.englishWord),
                
              );
            }, 
           separatorBuilder: (cntx, intdex){
            return SizedBox(height: 10,);
           }, 
           itemCount: dataList.length),
           BottomNavigation(),
           RadioButton()
         ],
       ),



        //__________________bottomNavigationBar_________________
        
      ),
    );
  }
}
