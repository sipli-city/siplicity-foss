import 'package:fluent_ui/fluent_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/constants.dart';
import 'package:siplicity/gen/siplicity/v1/siplicity.pb.dart';

part 'records_provider.g.dart';

@riverpod
Future<List<TreeViewItem>> records(RecordsRef ref) async {
  final response =
      await ref.read(siplicityClientProvider).listRecords(ListRecordsRequest());
  final tvi = TreeViewItem(
      content: Text(response.name),
      value: Text(response.name),
      children: addChildren(response.children));
  return <TreeViewItem>[
    tvi,
  ];
}

List<TreeViewItem> addChildren(List<ListRecordsResponse> list) {
  return list
      .map((item) => TreeViewItem(
          content: Text(item.name),
          value: Text(item.name),
          children: addChildren(item.children)))
      .toList();
}
