import 'package:app_flutter/home/home_view.dart';
import 'package:app_flutter/panel/panel_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => const HomePage(),
      '/panel': (context) => const PanelPage()
    },
  ));
}
