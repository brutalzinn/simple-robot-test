all:
	setup-websocket-emulator && setup-flutter-test


setup-websocket-emulator:
	python3 -m python_socket_tester

setup-flutter-test:
	flutter run app_flutter/main.dart
