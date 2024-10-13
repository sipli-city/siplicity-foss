import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/analysis/widgets/feature_list.dart';
import 'package:siplicity/analysis/widgets/line_chart.dart';
import 'package:siplicity/analysis/widgets/progress_chart.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

const charts = [
  ReportType.REPORT_TYPE_EXTENSIONS,
];

const labels = [
  "Extensions",
  "Format class",
];

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ProgressChart(typ: ReportType.REPORT_TYPE_EXTENSIONS),
          SizedBox(width: 50),
          FeatureList(typ: ReportType.REPORT_TYPE_EXTENSIONS)
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          LineChart(typ: ReportType.REPORT_TYPE_MODIFIED),
          SizedBox(width: 50),
          FeatureList(typ: ReportType.REPORT_TYPE_MODIFIED)
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ProgressChart(typ: ReportType.REPORT_TYPE_FILE_FORMAT),
          SizedBox(width: 50),
          FeatureList(typ: ReportType.REPORT_TYPE_FILE_FORMAT)
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ProgressChart(typ: ReportType.REPORT_TYPE_FORMAT_CLASS),
          SizedBox(width: 50),
          FeatureList(typ: ReportType.REPORT_TYPE_FORMAT_CLASS)
        ]),
      ],
    ));
  }
}
