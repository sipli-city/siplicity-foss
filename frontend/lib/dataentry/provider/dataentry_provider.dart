import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/client.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';
import 'package:siplicity/details/provider/fieldpaths_provider.dart';
import 'package:siplicity/dataentry/provider/filter_provider.dart';

part 'dataentry_provider.g.dart';

@riverpod
Future<int> countEntries(Ref ref) async {
  final response =
      await siplicityServiceClient.countRecords(CountRecordsRequest(
    id: -1,
    graph: ref.watch(graphTypProvider),
    query: ref.watch(queryStringProvider),
    typs: ref.watch(recordTypesProvider),
  ));
  if (ref.read(recordTypesProvider.notifier).includesRoot()) {
    return response.count - 1; // less one for the root node
  }
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
  Future<List<(int, List<String>)>> build(int page) async {
    final response = await siplicityServiceClient.listRecords(
        ListRecordsRequest(
            id: -1,
            graph: ref.watch(graphTypProvider),
            query: ref.watch(queryStringProvider),
            typs: ref.watch(recordTypesProvider),
            page: page,
            fields: ref.watch(fieldpathsProvider)));
    if (response.children.isEmpty) {
      return [];
    }
    return response.children.map((child) {
      List<String> li = [typToStr(child.typ), child.name];
      for (var field in child.fields) {
        li.add(field.value);
      }
      return (child.id, li);
    }).toList();
  }
}
