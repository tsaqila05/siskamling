import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Hi RT !',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Menu 1'),
            onTap: () {
              Navigator.pop(context); // Menutup Drawer
            },
          ),
          ListTile(
            title: Text('Menu 2'),
            onTap: () {
              Navigator.pop(context); // Menutup Drawer
            },
          ),
          // Tambahkan lebih banyak ListTile sesuai kebutuhan
        ],
      ),
    );
  }
}
