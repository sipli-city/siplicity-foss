import 'screens/home.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';

void main() {
  Process.run('server', []);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FluentApp(
      title: 'Siplicity',
      home: const HomePage(),
      theme: FluentThemeData(
        brightness: Brightness.light,
        accentColor: Colors.teal,
      ),
    );
  }
}
