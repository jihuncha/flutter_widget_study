


import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

//웹뷰 상태 타입
enum WebViewStateType{
  //로딩, 잘나오는상태, 에러상태, 팝업떠있는상태
  LOADING, STABLE, ERROR, POPUP
}

@immutable
abstract class WebViewState extends Equatable {
  final WebViewStateType currentState;

  const WebViewState({required this.currentState});
}

//웹뷰 상태 관리
class WebViewCurrentState extends WebViewState {
  const WebViewCurrentState({required WebViewStateType currentState})
      : super(currentState: currentState);

  @override
  List<Object> get props => [currentState];
}

//에러상황일때는 code를 가져와서 알맞는 팝업이나 문구를 띄워주도록 한다.
class WebViewError extends WebViewState {
  const WebViewError({required WebViewStateType currentState, required this.errorCode})
      : super(currentState: currentState);

  final int errorCode;

  @override
  List<Object> get props => [currentState, errorCode];
}

//웹뷰 로딩중일떄 (?) - Loading Progress bar 제공
// class WebviewInProgress extends WebViewState {
//   @override
//   List<Object> get props => [];
// }
//
// //웹뷰가 정상적으로 표시되고 있는 상태.
// class WebviewInStable extends WebViewState {
//   @override
//   List<Object> get props => [];
// }
//
// //웹뷰가 미발생일경우
// class WebviewException extends WebViewState {
//   @override
//   List<Object> get props => [];
// }