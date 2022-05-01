import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/services.dart' show DeviceOrientation, MethodChannel, SystemChrome, SystemUiMode, SystemUiOverlay, rootBundle;


import '../blocs/webview/webview_cubit.dart';
import '../utils/log.dart';
import '../utils/webview_utils.dart';

class CommonWebViewTemp extends StatelessWidget {
  const CommonWebViewTemp(this.initialUrl);

  final String initialUrl;
  // BlocProvider webviewInit(BuildContext context) {
  //   InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
  //       crossPlatform: InAppWebViewOptions(
  //         useShouldOverrideUrlLoading: true,
  //         mediaPlaybackRequiresUserGesture: false,
  //       ),
  //       android: AndroidInAppWebViewOptions(
  //         // useShouldInterceptRequest: true,
  //         useHybridComposition: true,
  //       ),
  //       ios: IOSInAppWebViewOptions(
  //         allowsInlineMediaPlayback: true,
  //       ));
  //
  //   Log.i("view init: ${this.initialUrl}");
  // return BlocProvider(
  //   create: (context) => WebviewCubit(),
  //   child: Stack(
  //     children: [
  //       InAppWebView(
  //         initialUrlRequest: URLRequest(url: Uri.parse(initialUrl)),
  //         initialUserScripts: UnmodifiableListView<UserScript>([]),
  //         initialOptions: options,
  //         onWebViewCreated: (controller) {
  //           WebViewUtil.addJSHandler(controller, context);
  //         },
  //         onLoadError: (controller, url, code, message) {
  //           Log.e('onLoadError: $code, $message');
  //           /** instead of printing the console message i want to render a static page or display static message **/
  //           // isErrorOccured = true;
  //           // isLoading = false;
  //           controller.loadFile(assetFilePath: "assets/test_inappwebview.html");
  //         },
  //         onLoadHttpError: (controller, url, code, message) async {
  //           Log.e('onLoadHttpError: $code, $message');
  //           /** instead of printing the console message i want to render a static page or display static message **/
  //           // isErrorOccured = true;
  //           // isLoading = false;
  //           controller.loadFile(assetFilePath: "assets/test_inappwebview.html");
  //         },
  //         onProgressChanged:(controller, progress) {
  //           Log.e("onProgressChanged - $progress");
  //           context.read<WebviewCubit>().progressChanged(progress);
  //         },
  //         // onProgressChanged: (controller, progress) => AppBloc.webviewProgressCubit.progressChanged(progress),
  //       ),
  //       BlocBuilder<WebviewCubit, WebViewState>(
  //         builder: (context, state) {
  //           if (state is WebviewInProgress) {
  //             Log.e("WebviewInProgress - ${state.progress}");
  //             if (state.progress != 100) {
  //               return CircularProgressIndicator();
  //             }
  //             return Container(height: 10, width: 10, color: Colors.red);
  //           }
  //           // if (state is WebviewInitial) {
  //           //   return Center(child: Text("No data found"));
  //           // } else if (state is WebviewInProgress) {
  //           //   if (state.progress != 100) {
  //           //     return CircularProgressIndicator();
  //           //   }
  //           //   return Container(height: 0, width: 0);
  //           // } else if (state is WebviewException) {
  //           //   Center(child: Text("No data found"));
  //           // } else if (state is WebviewInStable) {
  //           //   // child:
  //           // }
  //           return Container(height: 10, width: 10, color: Colors.green);
  //         },
  //       ),
  //     ],
  //   ),
  // );

  InAppWebView webviewInit(BuildContext context) {
    InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false,
        ),
        android: AndroidInAppWebViewOptions(
          // useShouldInterceptRequest: true,
          useHybridComposition: true,
        ),
        ios: IOSInAppWebViewOptions(
          allowsInlineMediaPlayback: true,
        ));
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse(initialUrl)),
      initialUserScripts: UnmodifiableListView<UserScript>([]),
      initialOptions: options,
      onWebViewCreated: (controller) {
        WebViewUtil.addJSHandler(controller, context);
      },
      onLoadError: (controller, url, code, message) {
        Log.e('onLoadError: $code, $message');
        /** instead of printing the console message i want to render a static page or display static message **/
        // isErrorOccured = true;
        // isLoading = false;
        controller.loadFile(assetFilePath: "assets/test_inappwebview.html");
      },
      onLoadHttpError: (controller, url, code, message) async {
        Log.e('onLoadHttpError: $code, $message');
        /** instead of printing the console message i want to render a static page or display static message **/
        // isErrorOccured = true;
        // isLoading = false;
        controller.loadFile(assetFilePath: "assets/test_inappwebview.html");
      },
      onProgressChanged: (controller, progress) {
        Log.e("onProgressChanged - $progress");
        // if (progress == 100) {
        // context.read<WebviewCubit>().onLoadStop();
        context.read<WebviewCubit>().progressChanged(controller, progress);
        // }
      },
      // onProgressChanged: (controller, progress) => AppBloc.webviewProgressCubit.progressChanged(progress),
      onLoadStop: (controller, url) {
        Log.i('onLoadStop');
        // context.read<WebviewCubit>().progressChanged(false);
        // context.read<WebviewCubit>().onLoadStop();

        context.read<WebviewCubit>().onLoadStop();
      },
      onLoadStart: (controller, url) {
        Log.i("onLoadStart");
        // context.read<WebviewCubit>().progressChanged(true);
        context.read<WebviewCubit>().onLoadStart();
      },
    );

    // InAppWebView webviewInit(BuildContext context) {
    //   InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    //       crossPlatform: InAppWebViewOptions(
    //         useShouldOverrideUrlLoading: true,
    //         mediaPlaybackRequiresUserGesture: false,
    //       ),
    //       android: AndroidInAppWebViewOptions(
    //         // useShouldInterceptRequest: true,
    //         useHybridComposition: true,
    //       ),
    //       ios: IOSInAppWebViewOptions(
    //         allowsInlineMediaPlayback: true,
    //       ));
    //   return InAppWebView(
    //     initialUrlRequest: URLRequest(url: Uri.parse(initialUrl)),
    //     initialUserScripts: UnmodifiableListView<UserScript>([]),
    //     initialOptions: options,
    //     onWebViewCreated: (controller) {
    //       WebViewUtil.addJSHandler(controller, context);
    //     },
    //     onLoadError: (controller, url, code, message) {
    //       Log.e('onLoadError: $code, $message');
    //       /** instead of printing the console message i want to render a static page or display static message **/
    //       // isErrorOccured = true;
    //       // isLoading = false;
    //       controller.loadFile(assetFilePath: "assets/test_inappwebview.html");
    //     },
    //     onLoadHttpError: (controller, url, code, message) async {
    //       Log.e('onLoadHttpError: $code, $message');
    //       /** instead of printing the console message i want to render a static page or display static message **/
    //       // isErrorOccured = true;
    //       // isLoading = false;
    //       controller.loadFile(assetFilePath: "assets/test_inappwebview.html");
    //     },
    //     onProgressChanged: (controller, progress) {
    //       Log.e("onProgressChanged - $progress");
    //       // if (progress == 100) {
    //         // context.read<WebviewCubit>().onLoadStop();
    //         context.read<WebviewCubit>().progressChanged(controller, progress);
    //       // }
    //     },
    //     // onProgressChanged: (controller, progress) => AppBloc.webviewProgressCubit.progressChanged(progress),
    //     onLoadStop: (controller, url) {
    //       Log.i('onLoadStop');
    //       // context.read<WebviewCubit>().progressChanged(false);
    //       // context.read<WebviewCubit>().onLoadStop();
    //
    //       context.read<WebviewCubit>().onLoadStop();
    //     },
    //     onLoadStart: (controller, url) {
    //       Log.i("onLoadStart");
    //       // context.read<WebviewCubit>().progressChanged(true);
    //       context.read<WebviewCubit>().onLoadStart();
    //     },
    //
    //   );
  }

  @override
  Widget build(BuildContext context) {
    // Show Navigation bar, Status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // Set Preferred Orientations
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // var myInAppWebview = webviewInit(context);

    //되는것
    return BlocProvider(
      create: (context) => WebviewCubit(),
      child: Stack(
        children: [
          webviewInit(context),
          BlocBuilder<WebviewCubit, WebViewState>(
            builder: (context, state) {
              if (state is WebviewInitial) {
                Log.e("WebviewInitial create!!");
              }
              if (state is WebviewInProgress) {
                Log.e("WebviewInProgress - ${state.toString()}");
                return CircularProgressIndicator(
                  backgroundColor: Colors.deepPurple,
                  color: Colors.black,
                );
              }
              return Container(height: 0, width: 0);
            },
          ),
        ],
      ),
    );
  }

//안됨
//   return BlocProvider(
//       create: (context) => WebviewCubit(),
//       child: BlocBuilder<WebviewCubit, WebViewState>(builder: (context, state) {
//         var myInAppWebview = webviewInit(context);
//         Stack(
//           alignment: Alignment.center,
//           fit: StackFit.expand,
//           children: [
//             myInAppWebview,
//             Center(
//               child: BlocBuilder<WebviewCubit, WebViewState>(
//                   builder: (context, state) {
//                 Log.d("build - ${state.toString()}");
//                 if (state is WebviewOnLoadStart || state is WebviewInProgress) {
//                   return CircularProgressIndicator(backgroundColor: Colors.deepPurple, color: Colors.black);
//                 }
//                   return Container(height: 0, width: 0);
//               }),
//             )
//           ],
//         );
//         return Container();
//       }));
// }
}

//   return
//     BlocProvider(
//       create: (context) => WebviewCubit(),
//       child: Stack(
//         alignment: Alignment.center,
//         fit: StackFit.expand,
//         children: [
//           // webviewInit(context),
//           myInAppWebview,
//           Center(
//             // child: BlocBuilder<WebviewCubit, WebViewState>(
//             //     builder: (context, state) {
//             //       Log.d("build - ${state.toString()}");
//             //       if (state is WebviewOnLoadStart || state is WebviewInProgress) {
//             //         return CircularProgressIndicator(
//             //             backgroundColor: Colors.deepPurple, color: Colors.black
//             //         );
//             //       }
//             //       return Container(height: 0, width: 0);
//             //     }
//             // ),
//           )
//         ],
//       ),
//     );


// return BlocProvider(
//   create: (context) => WebviewCubit(),
//   child: BlocBuilder<WebviewCubit, WebViewState>(
//     builder: (context, state) {
//       var myInAppWebview = webviewInit(context);
//
//     if (state is WebviewOnLoadStart || state is WebviewInProgress) {
//       Log.d("build progress incoming - ${state.toString()}");
//       // return Stack(
//       //   children: [
//       //     myInAppWebview,
//       //   ],
//       // );
//       return CircularProgressIndicator(
//           backgroundColor: Colors.deepPurple, color: Colors.black);
//
//       } else {
//         return Stack(
//           children: [
//             myInAppWebview,
//           ],
//         );
//       }

// }
//
// if (state is WebviewInStable) {
//   Log.d("state/WebviewInStable");
//   return Stack(
//     children: [
//       myInAppWebview,
//     ],
//   );
// }
//   if (state.progress == 100) {
//     return Stack(
//       children: [
//         myInAppWebview,
//       ],
//     );
//   }
//   return CircularProgressIndicator(
//       backgroundColor: Colors.deepPurple,
//       color: Colors.black
//   );
// }
// return Stack(
//   children: [
//     myInAppWebview,
//   ],
// );
// }
// Stack(
//   children: [
//     webviewInit(context),
//     BlocBuilder<WebviewCubit, WebViewState>(
//       builder: (context, state) {
//         if (state is WebviewInitial) {
//           Log.e("WebviewInitial create!!");
//         }
//         if (state is WebviewInProgress) {
//           Log.e("WebviewInProgress - ${state.progress}");
//           // if (state.progress != 100) {
//           return CircularProgressIndicator(
//             backgroundColor: Colors.deepPurple,
//             color: Colors.black,
//           );
//           // }
//           // return Container(height: 50, width: 50, color: Colors.red);
//         }
//         // if (state is WebviewInitial) {
//         //   return Center(child: Text("No data found"));
//         // } else if (state is WebviewInProgress) {
//         //   if (state.progress != 100) {
//         //     return CircularProgressIndicator();
//         //   }
//         //   return Container(height: 0, width: 0);
//         // } else if (state is WebviewException) {
//         //   Center(child: Text("No data found"));
//         // } else if (state is WebviewInStable) {
//         //   // child:
//         // }
//         return Container(height: 30, width: 80, color: Colors.green);
//       },
//     ),
//   ],
// ),
// );


// return BlocProvider(
//   create: (context) => WebviewCubit(),
//   child: Stack(
//     children: [
//       webviewInit(context),
//       BlocBuilder<WebviewCubit, WebViewState>(
//         builder: (context, state) {
//           if (state is WebviewInitial) {
//             Log.e("WebviewInitial create!!");
//           }
//           if (state is WebviewInProgress) {
//             Log.e("WebviewInProgress - ${state.progress}");
//             // if (state.progress != 100) {
//               return CircularProgressIndicator(
//                 backgroundColor: Colors.deepPurple,
//                 color: Colors.black,
//               );
//             // }
//             // return Container(height: 50, width: 50, color: Colors.red);
//           }
//           // if (state is WebviewInitial) {
//           //   return Center(child: Text("No data found"));
//           // } else if (state is WebviewInProgress) {
//           //   if (state.progress != 100) {
//           //     return CircularProgressIndicator();
//           //   }
//           //   return Container(height: 0, width: 0);
//           // } else if (state is WebviewException) {
//           //   Center(child: Text("No data found"));
//           // } else if (state is WebviewInStable) {
//           //   // child:
//           // }
//           return Container(height: 30, width: 80, color: Colors.green);
//         },
//       ),
//     ],
//   ),
// );
// }
// }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class CommonWebView extends StatefulWidget {
  final String initialUrl;

  const CommonWebView(this.initialUrl);

  @override
  State<CommonWebView> createState() => _WebviewPageState(initialUrl);
}

class _WebviewPageState extends State<CommonWebView> with TickerProviderStateMixin{

  final String initialUrl;

  static const int _timeout = 5000;
  var timeout = true;
  var isErrorOccured = false;

  // Loading Progress 를 표시하기 위한 멤버변수
  var isLoading = false;
  late AnimationController _animController;

  // var  = true;
  static const platform = const MethodChannel('native');

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        // useShouldInterceptRequest: true,
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  _WebviewPageState(this.initialUrl);

  @override
  void initState() {
    super.initState();
    // S.load(const Locale('kr'));
    //
    // // Circular Process Animation Init
    // _animController = AnimationController(
    //   // AnimationControllers can be created with
    //   // `vsync: this` because of TickerProviderStateMixin.
    //   vsync: this,
    //   duration: const Duration(seconds: 1),
    // )..addListener(() {
    //   setState(() {});
    // });
    //
    // _animController.repeat();

    // Enable hybrid composition.
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    // Show Navigation bar, Status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // Set Preferred Orientations
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return Scaffold(
      body: SafeArea(
        // Widget 을 겹치게 배치할 수 있는 Widget
          child: Stack(
            children: [
              WillPopScope(
                onWillPop: () => _goBack(context),
                child: InAppWebView(
                  // key: webViewKey,
                  // contextMenu: contextMenu,
                  // initialUrlRequest:
                  // URLRequest(url: Uri.parse(_urlHome)),
                  initialUrlRequest: URLRequest(url: Uri.parse(initialUrl)),
                  initialUserScripts: UnmodifiableListView<UserScript>([]),
                  initialOptions: options,
                  // pullToRefreshController: pullToRefreshController,
                  onWebViewCreated: (controller) {
                    WebViewUtil.addJSHandler(controller, context);
                  },
                  onLoadStart: (controller, url) {
                    // Log.i("onLoadStart");
                    // 220422 릴리즈에 맞춰 비활성화 처리
                    // context.read<MainTabCubit>().onVisibilityChanged(false);
                    isLoading = true;
                    // if (isErrorOccured == true) {
                    //   return;
                    // }
                    // timeout = true;
                    // Future.delayed(const Duration(milliseconds: _timeout), () {
                    //   log.info("check timeout : $timeout");
                    //   if (timeout == true) {
                    //     isErrorOccured = true;
                    //     controller.loadFile(assetFilePath: "assets/test_inappwebview.html");
                    //     // controller.stopLoading();
                    //   }
                    // });

                    // setState(() {
                    //   this.url = url.toString();
                    //   urlController.text = this.url;
                    // });
                  },
                  // androidOnPermissionRequest: (controller, origin, resources) async {
                  //   return PermissionRequestResponse(
                  //       resources: resources,
                  //       action: PermissionRequestResponseAction.GRANT);
                  // },
                  shouldOverrideUrlLoading: (controller, navigationAction) async {
                    // Log.i('shouldOverrideUrlLoading');
                    //   var uri = navigationAction.request.url!;
                    //
                    //   if (![
                    //     "http",
                    //     "https",
                    //     "file",
                    //     "chrome",
                    //     "data",
                    //     "javascript",
                    //     "about"
                    //   ].contains(uri.scheme)) {
                    //     if (await canLaunch(url)) {
                    //       // Launch the App
                    //       await launch(
                    //         url,
                    //       );
                    //       // and cancel the request
                    //       return NavigationActionPolicy.CANCEL;
                    //     }
                    //   }
                    //
                    //   return NavigationActionPolicy.ALLOW;
                  },

                  onLoadStop: (controller, url) async {
                    // Log.i('onLoadStop');
                    // 220422 릴리즈에 맞춰 비활성화 처리
                    // context.read<MainTabCubit>().onVisibilityChanged(true);
                    // _showPermissionNoticeDialog();
                    isLoading = false;
                  },
                  //
                  onLoadError: (controller, url, code, message) {
                    // Log.e('onLoadError: $code, $message');
                    /** instead of printing the console message i want to render a static page or display static message **/
                    isErrorOccured = true;
                    isLoading = false;
                    controller.loadFile(
                        assetFilePath: "assets/test_inappwebview.html");
                  },
                  onLoadHttpError: (controller, url, code, message) async {
                    // Log.e('onLoadHttpError: $code, $message');
                    /** instead of printing the console message i want to render a static page or display static message **/
                    isErrorOccured = true;
                    isLoading = false;
                    controller.loadFile(
                        assetFilePath: "assets/test_inappwebview.html");
                  },
                  onProgressChanged: (controller, progress) async {
                    // timeout = false;
                    if (progress == 100) {
                      final url = await controller.getUrl();
                      if (url == null) {
                        //인증서 문제 있는 망 붙었을때 e.g) 박살난 coway.io, iCloud+ Private, VPN
                        controller.loadFile(
                            assetFilePath: "assets/test_inappwebview.html");
                      }

                      timeout = false;
                    }
                  },
                  onConsoleMessage: (controller, consoleMessage) {
                    Log.i(consoleMessage);
                  },
                ),
              ),
              // child Widget 의 visibility 를 조정 가능한 Widget
              Visibility(
                child: Center(
                  child: CircularProgressIndicator(
                    value: _animController.value,
                    color: Colors.black,
                  ),
                ),
                visible: isLoading,
              ),
            ],
          )),
    );
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  Future<bool> _goBack(BuildContext context) async {
    if (await webViewController!.canGoBack()) {
      webViewController!.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  // void _showPermissionNoticeDialog() {
  //   final permissionJson = remoteConfig.value?.getValue("permission_notice").asString() ?? '';
  //   final permissionModel = PermissionNoticeModel.fromJson(jsonDecode(permissionJson));
  //
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return PermissionNoticeDialog(data: permissionModel);
  //       });
  // }
}
