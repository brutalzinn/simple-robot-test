import 'package:app_flutter/core/web_socket/web_socket_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'web_socket_connection_state.dart';

class WebSocketConnectionBloc
    extends Bloc<WebSocketConnectionEvent, WebSocketConnectionState> {
  late WebSocketChannel _channel;

  ///set initial state with the correct simple robot connection socket
  ///This is moment to rewrite the python moviments to here.
  static const initialState = WebSocketConnectionState(
      address: "192.168.0.155",
      gateway: "192.168.0.1",
      port: 5000,
      connected: false);

  WebSocketConnectionBloc() : super(initialState) {
    Future<void> _connect(
        OnConnect event, Emitter<WebSocketConnectionState> emit) async {
      final url = state.toUrl();
      _channel = WebSocketChannel.connect(Uri.parse(url));
      _channel.sink.add("hand");
      final connected = _channel.closeReason == null;
      if (connected) {
        emit(state.copyWith(connected: true));
      }
      emit(state.copyWith(connected: false));
      await emit.onEach<dynamic>(_channel.stream,
          onData: (data) => add(OnEspResponse(data)));
    }

    void _onReceiveMessage(
      OnEspResponse event,
      Emitter<WebSocketConnectionState> emit,
    ) {
      print("esp 8266 says ${event.response}");
    }

    void _onBatteryLevel(
      OnBatteryLevelChange event,
      Emitter<WebSocketConnectionState> emit,
    ) {
      print("esp 8266 says that the battery level is ${event.batteryLevel}");
    }

    void sendMessage(
      OnEspRequest event,
      Emitter<WebSocketConnectionState> emit,
    ) {
      _channel.sink.add(event.request);
      print("Sending ${event.request}");
    }

    on<OnConnect>(_connect);
    on<OnEspResponse>(_onReceiveMessage);
    on<OnBatteryLevelChange>(_onBatteryLevel);
  }
}
