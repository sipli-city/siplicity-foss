import 'dart:io';
import 'dart:ui';
import 'package:flutter/foundation.dart' as foundation;
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/client.dart';
import 'package:siplicity/home.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

void main() {
  if (foundation.kReleaseMode) Process.run('server', []);
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
      if (foundation.kReleaseMode) {
        siplicityServiceClient.shutdown(ShutdownRequest());
      }
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
        accentColor: Colors.orange,
      ),
    );
  }
}
