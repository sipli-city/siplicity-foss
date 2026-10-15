import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphic/graphic.dart';
import 'package:siplicity/analysis/provider/features_provider.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

class PieChart extends ConsumerWidget {
  final ReportType typ;
  const PieChart({super.key, required this.typ});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tuples = ref.watch(featuresProvider(report: typ));

    return switch (tuples) {
      AsyncData(:final value) => Container(
          margin: const EdgeInsets.only(top: 10),
          width: 350,
          height: 200,
          child: Chart(
            data: asTuples(label(typ), value),
            variables: {
              label(typ): Variable(
                accessor: (Map map) => map[label(typ)] as String,
              ),
              'count': Variable(
                accessor: (Map map) => map['count'] as num,
                scale: LinearScale(min: 0),
              ),
            },
            transforms: [
              Proportion(
                variable: 'count',
                as: 'percent',
              ),
            ],
            marks: [
              IntervalMark(
                position: Varset('percent') / Varset('extension'),
                modifiers: [StackModifier()],
                color: ColorEncode(
                  variable: 'extension',
                  values: pallette,
                ),
                label: LabelEncode(
                  encoder: (tuple) => Label(
                    tuple['extension'].toString(),
                    LabelStyle(textStyle: Defaults.runeStyle),
                  ),
                ),
              )
            ],
            coord: PolarCoord(
              transposed: true,
              dimCount: 1,
            ),
          )),
      _ => const Text("loading"),
    };
  }
}
