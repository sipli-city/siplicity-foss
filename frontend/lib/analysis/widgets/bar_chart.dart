import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphic/graphic.dart';
import 'package:siplicity/analysis/provider/features_provider.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

class BarChart extends ConsumerWidget {
  final ReportType typ;
  const BarChart({super.key, required this.typ});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tuples = ref.watch(featuresProvider(report: typ));

    return switch (tuples) {
      AsyncData(:final value) => Container(
          margin: const EdgeInsets.only(top: 10),
          width: 500,
          height: 300,
          child: Chart(
            data: asTuples(label(typ), value),
            variables: {
              label(typ): Variable(
                accessor: (Map map) => map[label(typ)] as String,
              ),
              'count': Variable(
                accessor: (Map map) => map['count'] as num,
              ),
            },
            marks: [
              IntervalMark(
                color: ColorEncode(encoder: tupleEncoder(95)),
              )
            ],
            coord: RectCoord(transposed: true),
            axes: [
              Defaults.verticalAxis
                ..line = Defaults.strokeStyle
                ..grid = null,
              Defaults.horizontalAxis
                ..line = null
                ..grid = Defaults.strokeStyle,
            ],
            selections: {'tap': PointSelection(dim: Dim.x)},
          ),
        ),
      _ => const Text("loading"),
    };
  }
}
