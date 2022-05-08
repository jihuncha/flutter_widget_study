import 'package:flutter/material.dart';

import 'widget/first_page.dart';
import 'widget/second_page.dart';

import 'app_router.gr.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: MainPage(),
    // );

    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      title: 'Flutter Auto Router',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

// @override
// Widget build(BuildContext context) {
//   return MaterialApp.router(
//     routerDelegate: _appRouter.delegate(),
//     routeInformationParser: _appRouter.defaultRouteParser(),
//     title: 'Flutter Auto Router',
//     theme: ThemeData(
//       primarySwatch: Colors.blue,
//     ),
//   );
// }

// class MainPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("토모다치"),
//         ),
//         body: Column(
//           children: <Widget>[
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => FirstPage()));
//               },
//               child: Text("FirstPage로!!"),
//             ),
//             ElevatedButton(
//               child: Text("second!!"),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             CommonWebViewTemp("www.naver.com")));
//               },
//             ),
//             ElevatedButton(
//               child: Text("thrid!!"),
//               onPressed: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) =>
//                             CommonWebViewTemp("www.naver.com")));
//               },
//             ),
//           ],
//         ));
//   }
// }
