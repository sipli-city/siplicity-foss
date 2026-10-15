import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphic/graphic.dart';
import 'package:siplicity/analysis/provider/features_provider.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

class FunnelChart extends ConsumerWidget {
  final ReportType typ;
  const FunnelChart({super.key, required this.typ});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tuples = ref.watch(featuresProvider(report: typ));

    return switch (tuples) {
      AsyncData(:final value) => Container(
                width: 500,
                height: 300,
                alignment: Alignment.center,
                child: Chart(
                  padding: (_) => const EdgeInsets.all(10),
                  data: asTuples(label(typ), value),
                  variables: {
                    label(typ): Variable(
                      accessor: (Map map) => map[label(typ)] as String,
                    ),
                    'count': Variable(
                      accessor: (Map map) => map['count'] as num,
                      scale: LinearScale(min: -200, max: 200),
                    ),
                  },
                  //transforms: [
                  //  Sort(
                  //    compare: (a, b) =>
                  //        ((b['count'] as num) - (a['count'] as num)).toInt(),
                  //  )
                 // ],
                  marks: [
                    IntervalMark(
                      label: LabelEncode(
                          encoder: (tuple) => Label(
                                tuple['count'].toString(),
                                LabelStyle(textStyle: Defaults.runeStyle),
                              )),
                      shape: ShapeEncode(value: FunnelShape()),
                      color: ColorEncode(
                          variable: label(typ), values: pallette),
                      modifiers: [SymmetricModifier()],
                    )
                  ],
                  coord: RectCoord(transposed: true, verticalRange: [1, 0]),
                ),
              ),
               _ => const Text("loading"),
    };
  }
}