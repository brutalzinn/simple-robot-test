import 'package:app_flutter/core/web_socket/bloc/web_socket_connection_bloc.dart';
import 'package:app_flutter/core/web_socket/bloc/web_socket_connection_state.dart';
import 'package:app_flutter/panel/panel_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/web_socket/bloc/web_socket_event.dart';

// class HomePage extends StatelessWidget {
//   /// {@macro counter_page}
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => WebSocketConnectionBloc(),
//       child: const HomePage(),
//     );
//   }
// }

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<WebSocketConnectionBloc, WebSocketConnectionState>(
      listener: (listenerContext, state) {
        if (state.connected) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PanelPage()),
          );
        }
      },
      child: Scaffold(
        body: Center(
          child: FilledButton.tonal(
              onPressed: () {
                context.read<WebSocketConnectionBloc>().add(OnConnect());
              },
              child: const Text('Connect')),
        ),
      ),
    );
  }
}
