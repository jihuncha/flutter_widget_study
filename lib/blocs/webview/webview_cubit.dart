

import 'package:equatable/equatable.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../utils/log.dart';


class WebviewCubit extends Cubit<WebViewState> {
  WebviewCubit() : super(WebviewInitial());

  void progressChanged(InAppWebViewController controller, int progress) {
    Log.e("WebviewCubit/progressChanged");
    emit(WebviewInProgress());
  }

  void onLoadStop() {
    Log.e("WebviewCubit/onLoadStop");
    emit(WebviewInStable());
  }

  void onLoadStart() {
    Log.e("WebviewCubit/onLoadStart");
    emit(WebviewOnLoadStart());
  }


}

@immutable
abstract class WebViewState extends Equatable {}

class WebviewInitial extends WebViewState {
  @override
  List<Object> get props => [];
}

class WebviewInProgress extends WebViewState {
  @override
  List<Object> get props => [];
}

class WebviewOnLoadStart extends WebViewState {
  @override
  List<Object> get props => [];
}

class WebviewInStable extends WebViewState {
  @override
  List<Object> get props => [];
}

class WebviewException extends WebViewState {
  @override
  List<Object> get props => [];
}
