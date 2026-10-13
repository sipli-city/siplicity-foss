import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphic/graphic.dart';
import 'package:siplicity/analysis/provider/features_provider.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

class LineChart extends ConsumerWidget {
  final ReportType typ;
  const LineChart({super.key, required this.typ});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tuples = ref.watch(featuresProvider(report: typ));

    return switch (tuples) {
      AsyncData(:final value) => Container(
          width: 500,
          height: 300,
          alignment: Alignment.center,
          child: Chart(
            data: asTuples(label(typ), value),
            variables: {
              'Last modified': Variable(
                accessor: (Map map) => map['last modified'] as String,
                scale: OrdinalScale(tickCount: 10),
              ),
              'Count': Variable(
                accessor: (Map map) => map['count'] as num,
              ),
            },
            marks: [
              AreaMark(
                shape: ShapeEncode(value: BasicAreaShape()),
                color: ColorEncode(value: Color(0xFFFF7F3E).withAlpha(80)),
              ),
              LineMark(
                  shape: ShapeEncode(value: BasicLineShape()),
                  color: ColorEncode(value: Color(0xFFFF7F3E))),
            ],
            axes: [
              Defaults.horizontalAxis,
              Defaults.verticalAxis,
            ],
            selections: {
              'touchMove': PointSelection(
                on: {
                  GestureType.scaleUpdate,
                  GestureType.tapDown,
                  GestureType.longPressMoveUpdate
                },
                dim: Dim.x,
              )
            },
            tooltip: TooltipGuide(
              followPointer: [false, true],
              align: Alignment.topLeft,
              offset: const Offset(-20, -20),
            ),
            crosshair: CrosshairGuide(followPointer: [false, true]),
          ),
        ),
      _ => const Text("loading"),
    };
  }
}
