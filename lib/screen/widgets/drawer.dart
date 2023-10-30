import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 59, 156, 236)),
            child: Center(
              child: Text(
                'English <-> മലയാളം Dictionary ',
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
