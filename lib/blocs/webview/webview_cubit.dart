

import 'webview_state.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import '../../utils/log.dart';


class WebviewCubit extends Cubit<WebViewState> {
  WebviewCubit() : super(const WebViewCurrentState(currentState: WebViewStateType.LOADING));

  void onLoadStop() {
    Log.d("WebviewCubit/onLoadStop");
    emit(const WebViewCurrentState(currentState: WebViewStateType.STABLE));
  }

  void onLoadFail(int errorCode) {
    Log.d("WebviewCubit/onError - $errorCode");
    emit(WebViewError(currentState: WebViewStateType.ERROR, errorCode: errorCode));
  }
}
