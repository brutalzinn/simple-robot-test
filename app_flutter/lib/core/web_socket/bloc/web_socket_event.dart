// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class WebSocketConnectionEvent extends Equatable {
  const WebSocketConnectionEvent();

  @override
  List<Object> get props => [];
}

class OnConnect extends WebSocketConnectionEvent {}

//Event handler for esp response
class OnEspResponse extends WebSocketConnectionEvent {
  final dynamic response;
  const OnEspResponse(this.response);

  @override
  List<Object> get props => [response];
}

class OnEspRequest extends WebSocketConnectionEvent {
  final dynamic request;
  const OnEspRequest(
    this.request,
  );

  @override
  List<Object> get props => [request];
}

class OnBatteryLevelChange extends WebSocketConnectionEvent {
  final dynamic batteryLevel;
  const OnBatteryLevelChange(
    this.batteryLevel,
  );

  @override
  List<Object> get props => [batteryLevel];
}
