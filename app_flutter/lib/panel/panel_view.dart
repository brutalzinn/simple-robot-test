import 'package:app_flutter/core/web_socket/web_socket_connection_bloc.dart';
import 'package:app_flutter/core/web_socket/web_socket_connection_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PanelPage extends StatelessWidget {
  const PanelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WebSocketConnectionBloc(),
      child: const PanelView(),
    );
  }
}

class PanelView extends StatelessWidget {
  const PanelView({super.key});
  @override
  Widget build(BuildContext context) {
    ///put web view to show esp 32 cam here
    ///
    return Scaffold(
        body: Column(
      children: [
        BlocBuilder<WebSocketConnectionBloc, WebSocketConnectionState>(
          builder: (context, state) {
          return Text("Status: ${state.connected} Battery:");
        }),
        const Text("This is the panel that will execute the moviments"),
      ],
    ));
  }
}
