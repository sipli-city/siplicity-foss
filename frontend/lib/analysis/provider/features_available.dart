import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/client.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

part 'features_available.g.dart';

@riverpod
Future<List<ReportType>> featuresAvailable(FeaturesAvailableRef ref) async {
  final response = await siplicityServiceClient
      .preparedFeatureAvailable(PreparedFeatureAvailableRequest());
  return response.report;
}
