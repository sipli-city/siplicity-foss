import 'screens/home.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:riverpod_annotation/riverpod_annotation.dart';

void main() => runApp(ProviderScope(child: MyApp()));

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
