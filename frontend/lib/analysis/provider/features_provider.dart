import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:primer_progress_bar/primer_progress_bar.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/client.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

part 'features_provider.g.dart';

Color getColor(int index) {
  switch (index) {
    case 0:
      return Color(0xFFFF7F3E);
    case 1:
      return Color(0xFF604CC3);
    case 2:
      return Color(0xFF80C4E9);
    case 3:
      return Color(0xFFF5004F);
    case 4:
      return Color(0xFFFF76CE);
    case 5:
      return Color(0xFFEAD196);
    case 6:
      return Color(0xFF14C38E);
    case 7:
      return Color(0xFFBF3131);
    case 8:
      return Color(0xFFDBFF3D);
    case 9:
      return Color(0xFFC70A80);
    case 10:
      return Color(0xFF39B5E0);
    case 11:
      return Color(0xFFC9F658);
    case 12:
      return Color(0xFF55968F);
    case 13:
      return Color(0xFF8ACBBB);
    case 14:
      return Colors.black;
    case 15:
      return Colors.magenta;
    case 16:
      return Colors.blue;
    case 17:
      return Colors.green;
    case 18:
      return Colors.red;
  }
  return Color(0xFFDADADA);
}

List<Segment> segment(String label, PreparedFeatureCountResponse response) {
  int idx = -1;
  var li = response.features.map((item) {
    idx++;
    return Segment(
        value: item.count, color: getColor(idx), label: Text(item.value));
  }).toList();
  return li;
}

@riverpod
class FeatureSegments extends _$FeatureSegments {
  @override
  Future<List<Segment>> build({required ReportType report, int? max}) async {
    PreparedFeatureCountResponse response =
        await siplicityServiceClient.preparedFeatureCount(
            PreparedFeatureCountRequest(report: report, max: max));
    switch (report) {
      case ReportType.REPORT_TYPE_EXTENSIONS:
        return segment("extension", response);
      case ReportType.REPORT_TYPE_FILE_FORMAT:
        return segment("file format", response);
      case ReportType.REPORT_TYPE_FORMAT_CLASS:
        return segment("format class", response);
      case ReportType.REPORT_TYPE_MIME_TYPE:
        return segment("mime", response);
      default:
        return List.empty();
    }
  }
}

List<Map<dynamic, dynamic>> tuple(
    String label, PreparedFeatureCountResponse response) {
  return response.features
      .map((item) => {label: item.value, "count": item.count})
      .toList();
}

@riverpod
class FeatureTuples extends _$FeatureTuples {
  @override
  Future<List<Map<dynamic, dynamic>>> build(
      {required ReportType report, int? max}) async {
    PreparedFeatureCountResponse response =
        await siplicityServiceClient.preparedFeatureCount(
            PreparedFeatureCountRequest(report: report, max: max));
    switch (report) {
      case ReportType.REPORT_TYPE_EXTENSIONS:
        return tuple("extension", response);
      case ReportType.REPORT_TYPE_MODIFIED:
        return tuple("last modified", response);
      case ReportType.REPORT_TYPE_FILE_FORMAT:
        return tuple("file format", response);
      case ReportType.REPORT_TYPE_FORMAT_CLASS:
        return tuple("format class", response);
      case ReportType.REPORT_TYPE_MIME_TYPE:
        return tuple("mime", response);
      default:
        return List.empty();
    }
  }
}
