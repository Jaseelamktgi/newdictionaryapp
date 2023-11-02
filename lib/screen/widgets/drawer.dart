import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newdictionaryapp/screen/widgets/getx.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final ColorController colorController = Get.put(ColorController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
                color: colorController.selectedIndex.value == 0
                    ? Color.fromARGB(255, 59, 156, 236)
                    : Colors.black),
            child: Center(
              child: Text(
                colorController.selectedIndex.value == 0
                    ? 'English <-> മലയാളം Dictionary '
                    : 'മലയാളം <-> English Dictionary',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.delete),
            iconColor: Colors.grey,
            title: Text('Delete History'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.keyboard),
            iconColor: Color.fromARGB(255, 7, 126, 205),
            title: Text('Go to Google Indic keyboard'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            iconColor: const Color.fromARGB(255, 174, 173, 173),
            title: Text('Settings'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.star),
            iconColor: Color.fromARGB(255, 250, 197, 23),
            title: Text('Rate Us'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            iconColor: Colors.grey,
            title: Text('About Us'),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
