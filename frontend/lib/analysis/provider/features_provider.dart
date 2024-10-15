import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/client.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

part 'features_provider.g.dart';

// 14 colours + default = 15 max
const List<Color> pallette = [
  Color(0xFFFF7F3E),
  Color(0xFF604CC3),
  Color(0xFF80C4E9),
  Color(0xFFF5004F),
  Color(0xFFFF76CE),
  Color(0xFFEAD196),
  Color(0xFF14C38E),
  Color(0xFFBF3131),
  Color(0xFFDBFF3D),
  Color(0xFFC70A80),
  Color(0xFF39B5E0),
  Color(0xFFC9F658),
  Color(0xFF55968F),
  Color(0xFF8ACBBB),
];

Color getColor(int index) {
  if (index >= 0 && index < pallette.length) {
    return pallette[index];
  }
  return Color(0xFFDADADA);
}

PreparedFeatureCountResponse limit(
    PreparedFeatureCountResponse response, int max) {
  if (response.features.length < max || max < 2) {
    return response;
  }
  var ret = response.features.sublist(0, max - 1);
  int other = response.features
      .sublist(max - 1)
      .fold<int>(0, (prev, feat) => prev + feat.count);
  ret.add(PreparedFeatureCountResponse_Feature(value: "other", count: other));
  return PreparedFeatureCountResponse(features: ret);
}

List<Segment> asSegments(PreparedFeatureCountResponse response) {
  int idx = -1;
  return response.features.map((item) {
    idx++;
    return Segment(
        value: item.count, color: getColor(idx), label: Text(item.value));
  }).toList();
}

String label(ReportType report) {
  switch (report) {
    case ReportType.REPORT_TYPE_EXTENSIONS:
      return "extension";
    case ReportType.REPORT_TYPE_MODIFIED:
      return "last modified";
    case ReportType.REPORT_TYPE_FILE_FORMAT:
      return "file format";
    case ReportType.REPORT_TYPE_FORMAT_CLASS:
      return "format class";
    case ReportType.REPORT_TYPE_MIME_TYPE:
      return "mime";
    default:
      return "";
  }
}

List<Map<dynamic, dynamic>> asTuples(
    String label, PreparedFeatureCountResponse response) {
  return response.features
      .map((item) => {label: item.value, "count": item.count})
      .toList();
}

@riverpod
class Features extends _$Features {
  @override
  Future<PreparedFeatureCountResponse> build(
      {required ReportType report}) async {
    PreparedFeatureCountResponse response =
        await siplicityServiceClient.preparedFeatureCount(
            PreparedFeatureCountRequest(report: report));
    return response;
  }
}
