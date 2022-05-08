import 'package:auto_route/annotations.dart';
import 'pages/myPageList.dart';
import 'widget/first_page.dart';
import 'widget/second_page.dart';


@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      path: '/webview',
      page: CommonWebViewTemp
    ),
    AutoRoute(
        path: '/temp',
        page: FirstPage,
    ),
  ],)
class $AppRouter {
  $AppRouter();
}
