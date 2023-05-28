import 'package:app_flutter/core/web_socket/bloc/web_socket_connection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/web_socket/bloc/web_socket_connection_state.dart';

// class PanelPage extends StatelessWidget {
//   const PanelPage({super.key});

//   // @override
//   // Widget build(BuildContext context) {
//   //   return BlocProvider(
//   //     create: (_) => WebSocketConnectionBloc(),
//   //     child: const PanelView(),
//   //   );
//   // }
// }

class PanelPage extends StatelessWidget {
  const PanelPage({super.key});
  @override
  Widget build(BuildContext context) {
    ///put web view to show esp 32 cam here
    return Scaffold(body:
        BlocBuilder<WebSocketConnectionBloc, WebSocketConnectionState>(
            builder: (context, state) {
      return Column(children: [
        Text("Status: ${state.connected} Battery {0}"),
        const Text("This is the panel that will execute the moviments"),
      ]);
    }));
  }
}
