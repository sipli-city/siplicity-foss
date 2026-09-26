import 'package:fluent_ui/fluent_ui.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/client.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

part 'records_provider.g.dart';

List<TreeViewItem> addChildren(List<ListRecordsResponse> list) {
  return list
      .map((item) => TreeViewItem(
          content: Text(item.name),
          value: Text(item.name),
          children: addChildren(item.children)))
      .toList();
}
/*
Iterable<TreeNode<String>> _addChildren(List<ListRecordsResponse> list) {
  return list.map((item) => TreeNode(data: item.name)
    ..addAll(addChildren(item.children) as Iterable<Node>));
}*/

@riverpod
class InputRecords extends _$InputRecords {
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

  Future<void> putAction({String? filter, String? action}) async {
    final status = await siplicityServiceClient
        .putJob(PutJobRequest(filter: filter, action: action));
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

@riverpod
class OutputRecords extends _$OutputRecords {
  @override
  Future<List<TreeViewItem>> build() async {
    final response = await siplicityServiceClient.listRecords(
        ListRecordsRequest(
            id: -1,
            output: true,
            display: GetField(namespace: "siplicity", name: "display_name")));
    final tvi = TreeViewItem(
        content: Text(response.name),
        value: Text(response.name),
        children: addChildren(response.children));
    return <TreeViewItem>[
      tvi,
    ];
  }

  Future<void> putAction({String? filter, String? action}) async {
    final status = await siplicityServiceClient
        .putJob(PutJobRequest(filter: filter, action: action));
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
