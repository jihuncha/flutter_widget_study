

import 'webview_state.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import '../../utils/log.dart';


class WebViewCubit extends Cubit<WebViewState> {
  WebViewCubit() : super(const WebViewCurrentState(currentState: WebViewStateType.LOADING));

  void onLoadStop() {
    Log.d("WebViewCubit/onLoadStop");
    emit(const WebViewCurrentState(currentState: WebViewStateType.STABLE));
  }

  void onLoadFail(int errorCode) {
    Log.d("WebViewCubit/onError - $errorCode");
    emit(WebViewError(currentState: WebViewStateType.ERROR, errorCode: errorCode));
  }

  //TODO push등이 왔을때??
  void onPopupShow(String popupUrl) {
    Log.d("WebViewCubit/onPopupShow");
    emit(WebViewShowPopup(currentState: WebViewStateType.POPUP, popupUrl: popupUrl));
  }
}
