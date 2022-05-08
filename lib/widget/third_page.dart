


import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("title!!"),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.red,
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
            ),
            Container(
              color: Colors.blue,
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
            ),
            Container(
              color: Colors.green,
              width: 60,
              height: 60,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
            )
          ],
        )
    );
  }
}
