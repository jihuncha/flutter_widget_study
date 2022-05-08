// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import 'widget/first_page.dart' as _i2;
import 'widget/second_page.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    CommonWebViewTemp.name: (routeData) {
      final args = routeData.argsAs<CommonWebViewTempArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.CommonWebViewTemp(args.initialUrl));
    },
    FirstRoute.name: (routeData) {
      final args = routeData.argsAs<FirstRouteArgs>(
          orElse: () => const FirstRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.FirstPage(key: args.key));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig('/#redirect',
            path: '/', redirectTo: '/webview', fullMatch: true),
        _i3.RouteConfig(CommonWebViewTemp.name, path: '/webview'),
        _i3.RouteConfig(FirstRoute.name, path: '/temp')
      ];
}

/// generated route for
/// [_i1.CommonWebViewTemp]
class CommonWebViewTemp extends _i3.PageRouteInfo<CommonWebViewTempArgs> {
  CommonWebViewTemp({required String initialUrl})
      : super(CommonWebViewTemp.name,
            path: '/webview',
            args: CommonWebViewTempArgs(initialUrl: initialUrl));

  static const String name = 'CommonWebViewTemp';
}

class CommonWebViewTempArgs {
  const CommonWebViewTempArgs({required this.initialUrl});

  final String initialUrl;

  @override
  String toString() {
    return 'CommonWebViewTempArgs{initialUrl: $initialUrl}';
  }
}

/// generated route for
/// [_i2.FirstPage]
class FirstRoute extends _i3.PageRouteInfo<FirstRouteArgs> {
  FirstRoute({_i4.Key? key})
      : super(FirstRoute.name, path: '/temp', args: FirstRouteArgs(key: key));

  static const String name = 'FirstRoute';
}

class FirstRouteArgs {
  const FirstRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'FirstRouteArgs{key: $key}';
  }
}
