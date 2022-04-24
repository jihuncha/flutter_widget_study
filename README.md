# flutter_widget_study

Widget Study Repo

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### 화면 배치에 쓰는 기본 위젯

* Container
    * 아무것도 없는 위젯
    * Child 로 자식 가질수잇음 (div느낌인듯)
    
~~~dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title!!"),
      ),
      body: Container(
        color: Colors.red,
        width: 100,
        height: 100,
      )
    );
  }
}
~~~
    
* Column
    * 수직 방향으로 배치
    * 레이아웃 대부분은 Column / Row 로 조합 구성
    
~~~dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("title!!"),
        ),
        body: Column(
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
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
            ),
            Container(
              color: Colors.green,
              width: 100,
              height: 100,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(8.0),
            )
          ],
        )
    );
  }
}
~~~

* Row
    * 수평 방향으로 설정
    
~~~dart
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title!!"),
      ),
      body: Row(
        mainAxisSize: MainAxisSize.max, //가로로 꽉채우기
        mainAxisAlignment: MainAxisAlignment.center, //가운데정렬
        crossAxisAlignment: CrossAxisAlignment.center, //세로방향으로 가운데정렬
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
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
          ),
          Container(
            color: Colors.green,
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
          )
        ],
      )
    );
  }
}
~~~

* Stack
    * Children 나열한 여러 위젯을 순서대로 겹치게함
    * 사진 위에 글자를 표현하거나, 화면 위에 로딩하는 형태로 구현 가능
    * Children Property 에서 가장 먼저 정의한것이 맨아래로 가고, 그 위로 쌓이는 형태
    
~~~dart
class MyHomePage extends StatelessWidget {
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
~~~

