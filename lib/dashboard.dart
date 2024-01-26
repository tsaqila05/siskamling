import 'package:flutter/material.dart';

import 'sidebar.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contoh Tombol Flutter'),
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
              onPressed: () {
                print('TextButton ditekan!');
              },
              child: Text(
                'Text Button',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                print('ElevatedButton ditekan!');
              },
              child: Text(
                'Elevated Button',
                style: TextStyle(fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
