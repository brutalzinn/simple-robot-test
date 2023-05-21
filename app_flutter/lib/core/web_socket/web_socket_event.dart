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
  bool operator ==(covariant OnEspResponse other) {
    if (identical(this, other)) return true;

    return other.response == response;
  }

  @override
  int get hashCode => response.hashCode;
}

class OnEspResponseEvent extends WebSocketConnectionEvent {
  final dynamic response;
  const OnEspResponseEvent(
    this.response,
  );

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
