import 'dart:convert';

import 'package:equatable/equatable.dart';

//separe this class after with response data from web socket
// ignore_for_file: public_member_api_docs, sort_constructors_first
class WebSocketConnectionState extends Equatable {
  final String gateway;
  final int port;
  final String address;
  final bool connected;
  const WebSocketConnectionState(
      {this.address = "192.168.0.155",
      this.gateway = "192.168.0.1",
      this.port = 5000,
      this.connected = false});

  String toUrl() => 'ws://$address:$port';

  WebSocketConnectionState copyWith({
    String? gateway,
    int? port,
    String? address,
    bool? connected,
  }) {
    return WebSocketConnectionState(
      gateway: gateway ?? this.gateway,
      port: port ?? this.port,
      address: address ?? this.address,
      connected: connected ?? this.connected,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gateway': gateway,
      'port': port,
      'address': address,
      'connected': connected,
    };
  }

  factory WebSocketConnectionState.fromMap(Map<String, dynamic> map) {
    return WebSocketConnectionState(
      gateway: map['gateway'] as String,
      port: map['port'] as int,
      address: map['address'] as String,
      connected: map['connected'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory WebSocketConnectionState.fromJson(String source) =>
      WebSocketConnectionState.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [gateway, port, address, connected];
}

class EspResponse extends WebSocketConnectionState {
  final dynamic response;
  const EspResponse(this.response);
  @override
  List<Object> get props => [response];
}

class EspRequest extends WebSocketConnectionState {
  final dynamic request;
  const EspRequest(this.request);
  @override
  List<Object> get props => [request];
}
