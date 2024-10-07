import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/analysis/widgets/progress_chart.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

const charts = [
  ReportType.REPORT_TYPE_EXTENSIONS,
  ReportType.REPORT_TYPE_FORMAT_CLASS
];

const labels = [
  "Extensions",
  "Format class",
];

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: charts.length,
        itemBuilder: (context, index) {
          final typ = charts[index];
          return ListTile.selectable(
            leading: ProgressChart(typ: typ),
            title: Text(labels[index]),
            selectionMode: ListTileSelectionMode.single,
          );
        });
    /*Container(
                margin: const EdgeInsets.only(top: 10),
                width: 350,
                height: 200,
                child: Chart(
                  data: value,
                  variables: {
                    'extension': Variable(
                      accessor: (Map map) => map['extension'] as String,
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
                        values: Defaults.colors10,
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
                )),*/
  }
}
