import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/client.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';
import 'package:siplicity/dataentry/provider/fieldselection_provider.dart';

part 'dataentry_provider.g.dart';

@riverpod
Future<int> countEntries(CountEntriesRef ref) async {
  final response =
      await siplicityServiceClient.countRecords(CountRecordsRequest(
    id: -1,
    graph: GraphType.GRAPH_TYPE_INPUT,
  ));
  return response.count;
}

String typToStr(RecordType typ) {
  switch (typ) {
    case RecordType.RECORD_TYPE_DIRECTORY:
      return "folder";
    default:
  }
  return "file";
}

@riverpod
class DataEntry extends _$DataEntry {
  @override
  Future<List<List<String>>> build(int page) async {
    final response = await siplicityServiceClient.listRecords(
        ListRecordsRequest(
            id: -1,
            graph: GraphType.GRAPH_TYPE_INPUT,
            page: page,
            fields: ref.watch(fieldSelectionProvider)));
    if (response.children.isEmpty) {
      return [];
    }
    return response.children.map((child) {
      List<String> li = [typToStr(child.typ), child.name];
      for (var field in child.fields) {
        li.add(field.value);
      }
      return li;
    }).toList();
  }
}
