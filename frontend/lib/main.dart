import 'dart:ui';

import 'screens/home.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:io';
import 'package:siplicity/client.dart';
import 'package:siplicity/gen/siplicity/v1/siplicity.pb.dart';

void main() {
  Process.run('server', []);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(onExitRequested: () async {
      siplicityServiceClient.shutdown(ShutdownRequest());
      return AppExitResponse.exit;
    });
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

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
