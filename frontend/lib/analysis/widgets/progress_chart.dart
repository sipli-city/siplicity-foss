import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';
import 'package:siplicity/analysis/provider/features_provider.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

class ProgressChart extends ConsumerWidget {
  final ReportType typ;
  const ProgressChart({super.key, required this.typ});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final segments = ref.watch(featureSegmentsProvider(report: typ, max: 20));

    return switch (segments) {
      AsyncData(:final value) => Container(
          margin: const EdgeInsets.only(top: 10),
          width: 350,
          height: 200,
          child: PrimerProgressBar(segments: value)),
      _ => const Text("loading"),
    };
  }
}
