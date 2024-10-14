import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/analysis/provider/features_available.dart';
import 'package:siplicity/analysis/widgets/analysis_item.dart';

class AnalysisPage extends ConsumerWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(featuresAvailableProvider);
    return switch (response) {
      AsyncData(:final value) => SingleChildScrollView(
            child: Column(
          children: value.map((typ) => AnalysisItem(typ: typ)).toList(),
        )),
      _ => const Text('loading')
    };
  }
}
