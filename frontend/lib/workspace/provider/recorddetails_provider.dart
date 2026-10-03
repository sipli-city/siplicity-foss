import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/client.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

part 'recorddetails_provider.g.dart';

@riverpod
class RecordDetails extends _$RecordDetails {
  @override
  Future<GetRecordResponse> build(int item) async {
    return await siplicityServiceClient.getRecord(GetRecordRequest(id: item));
  }
}
