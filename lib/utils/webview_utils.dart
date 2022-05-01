import 'dart:io';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class JSHandlerConst {
  static const String routeClose = "close";
  static const String routeBack = "back";
  static const String routeOpenUrl = "openUrl";

  static const String authOpenLogin = "openLogin";
  static const String authLogout = "logout";
  static const String authGetToken = "getToken";

  static const String logSend = "sendLog";

}

class WebViewUtil {
  // static final Env _env = getIt<Env>();
  // static final CommonPreferences _commonPref = getIt<CommonPreferences>();

  static const _platform = MethodChannel('native');

  static void addJSHandler(
      InAppWebViewController controller, BuildContext context) {

  }
}
