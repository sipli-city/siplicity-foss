import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/analysis/provider/features_available.dart';
import 'package:siplicity/analysis/widgets/analysis_item.dart';
import 'package:siplicity/analysis/widgets/intro_item.dart';

class AnalysisPage extends ConsumerWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(featuresAvailableProvider);
    return switch (response) {
      AsyncData(:final value) => value.isEmpty ? Padding(padding: EdgeInsets.all(20), child: Text("Nothing to analyse yet - add content to the workspace")) : SingleChildScrollView(
            child: Column(
          children: [IntroItem(), ...value.map((typ) => AnalysisItem(typ: typ))],
        )),
      _ => const Padding(padding: EdgeInsets.all(20), child: Text('loading'))
    };
  }
}
