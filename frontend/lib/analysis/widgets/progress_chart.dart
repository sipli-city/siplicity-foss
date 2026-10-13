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
    final segments = ref.watch(featuresProvider(report: typ));

    return switch (segments) {
      AsyncData(:final value) => Container(
          width: 500,
          height: 300,
          alignment: Alignment.center,
          child: value.features.isNotEmpty
              ? PrimerProgressBar(segments: asSegments(limit(value, 15)))
              : Text("Placeholder")),
      _ => const Text("loading"),
    };
  }
}
