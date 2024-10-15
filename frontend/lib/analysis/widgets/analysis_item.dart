import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/analysis/widgets/feature_list.dart';
import 'package:siplicity/analysis/widgets/funnel_chart.dart';
import 'package:siplicity/analysis/widgets/pie_chart.dart';
import 'package:siplicity/analysis/widgets/line_chart.dart';
import 'package:siplicity/analysis/widgets/progress_chart.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

class AnalysisItem extends StatelessWidget {
  final ReportType typ;
  const AnalysisItem({super.key, required this.typ});

  @override
  Widget build(BuildContext context) {
    String title;
    Widget chart;
    switch (typ) {
      case ReportType.REPORT_TYPE_SIZES:
        title = "File sizes";
        chart = FunnelChart(typ: typ);
      case ReportType.REPORT_TYPE_MODIFIED:
        title = "Last modified date";
        chart = LineChart(typ: typ);
      case ReportType.REPORT_TYPE_DUPLICATES:
        title = "Duplicate files";
        chart = FunnelChart(typ: typ);
      case ReportType.REPORT_TYPE_EXTENSIONS:
        title = "File format extensions";
        chart = ProgressChart(typ: typ);
      case ReportType.REPORT_TYPE_FILE_FORMAT:
        title = "File format ID (PRONOM)";
        chart = ProgressChart(typ: typ);
      case ReportType.REPORT_TYPE_MIME_TYPE:
        title = "MIME type (PRONOM)";
        chart = ProgressChart(typ: typ);
      case ReportType.REPORT_TYPE_FORMAT_CLASS:
        title = "File format class (PRONOM)";
        chart = ProgressChart(typ: typ);
      case ReportType.REPORT_TYPE_MULTIPLE_IDENTIFICATION:
        title = "Multiple identificatoin (PRONOM)";
        chart = PieChart(typ: typ);
      default:
        title = "Unknown";
        chart = ProgressChart(typ: typ);
    }

    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Color(0x0f000000)))),
        child: Column(
          children: [
            Row(children: [
              Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    title,
                    style: FluentTheme.of(context).typography.subtitle,
                  ))
            ]),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [chart, SizedBox(width: 50), FeatureList(typ: typ)]),
          ],
        ));
  }
}
