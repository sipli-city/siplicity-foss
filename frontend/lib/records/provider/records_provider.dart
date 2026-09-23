import 'package:fluent_ui/fluent_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/client.dart';
import 'package:siplicity/gen/siplicity/v1/siplicity.pb.dart';

part 'records_provider.g.dart';

@riverpod
class Records extends _$Records {
  @override
  Future<List<TreeViewItem>> build() async {
    final response =
        await siplicityServiceClient.listRecords(ListRecordsRequest(id: -1));
    final tvi = TreeViewItem(
        content: Text(response.name),
        value: Text(response.name),
        children: addChildren(response.children));
    return <TreeViewItem>[
      tvi,
    ];
  }

  Future<void> putFilePath(Future<String?> path) async {
    final p = await path;
    if (p == null) {
      return;
    }
    final status =
        await siplicityServiceClient.putFilePath(PutFilePathRequest(path: p));
    while (true) {
      final done = await siplicityServiceClient
          .getStatus(GetStatusRequest(status: status.status));
      if (done.done) {
        ref.invalidateSelf();
        break;
      }
      await Future.delayed(const Duration(milliseconds: 20));
    }
  }
}

List<TreeViewItem> addChildren(List<ListRecordsResponse> list) {
  return list
      .map((item) => TreeViewItem(
          content: Text(item.name),
          value: Text(item.name),
          children: addChildren(item.children)))
      .toList();
}
