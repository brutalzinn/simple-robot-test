import 'package:app_flutter/core/web_socket/bloc/web_socket_connection_bloc.dart';
import 'package:app_flutter/home/home_view.dart';
import 'package:app_flutter/panel/panel_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (_) => WebSocketConnectionBloc(),
    child: MaterialApp(
      routes: {
        '/': (context) => const HomePage(),
        '/panel': (context) => const PanelPage()
      },
    ),
  ));
}
