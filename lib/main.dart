import 'package:flutter/material.dart';

import 'widget/first_page.dart';
import 'widget/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("토모다치"),
      ),
      body: Column(
          children: <Widget>[
          ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstPage()));
          },
      child: Text("FirstPage로!!"),
    ),
      ElevatedButton(
      child: Text("second!!"),
      onPressed: (){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CommonWebViewTemp("abfsdaddss")));
      },
            ),
          ],
        ));
  }
}