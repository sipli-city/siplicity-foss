import 'package:fluent_ui/fluent_ui.dart';
import 'package:file_picker/file_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/client.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';
import 'package:siplicity/workspace/provider/treeselection_provider.dart';

part 'workspace_provider.g.dart';

@riverpod
class QueryRecords extends _$QueryRecords {
  @override
  String? build() {
    return null;
  }

  void updateQuery(String? query) {
    state = query;
  }
}

Icon? getIcon(RecordType typ) {
  switch (typ) {
    case RecordType.RECORD_TYPE_DIRECTORY:
      return Icon(
        FluentIcons.fabric_folder,
        color: Color(0xFFFF7F3E),
      );
    case RecordType.RECORD_TYPE_FILE:
      return Icon(
        FluentIcons.text_document,
      );
    case RecordType.RECORD_TYPE_VIRTUAL_DIRECTORY:
      return Icon(
        FluentIcons.fabric_folder,
        color: Color(0xFF604CC3),
      );
    case RecordType.RECORD_TYPE_VIRTUAL_FILE:
      return Icon(
        FluentIcons.text_document,
        color: Color(0xFF604CC3),
      );
    default:
      return null;
  }
}

List<TreeViewItem> addChildren(List<ListRecordsResponse> list) {
  return list
      .map((item) => TreeViewItem(
          leading: getIcon(item.typ),
          content: Text(item.name),
          value: item.id,
          children: addChildren(item.children)))
      .toList();
}

@riverpod
class InputRecords extends _$InputRecords {
  @override
  Future<List<TreeViewItem>> build() async {
    final response = await siplicityServiceClient.listRecords(
        ListRecordsRequest(
            id: -1,
            graph: GraphType.GRAPH_TYPE_INPUT,
            display: true,
            query: ref.watch(queryRecordsProvider)));
    final query = ref.watch(queryRecordsProvider);
    final root = (query == null)
        ? Text(response.name)
        : Row(children: [
            Text(response.name),
            SizedBox(width: 20),
            Button(
              child: Text("Clear query"),
              onPressed: () =>
                  ref.read(queryRecordsProvider.notifier).updateQuery(null),
            )
          ]);
    final tvi = TreeViewItem(
        content: root,
        value: response.id,
        children: addChildren(response.children));
    return <TreeViewItem>[
      tvi,
    ];
  }

  Future<void> _putSinglePath(String path) async {
    final status = await siplicityServiceClient
        .putFilePath(PutFilePathRequest(path: path));
    while (true) {
      final done = await siplicityServiceClient
          .getStatus(GetStatusRequest(status: status.status));
      if (done.status != StatusType.STATUS_TYPE_WORKING) {
        break;
      }
      await Future.delayed(const Duration(milliseconds: 20));
    }
  }

  Future<void> putFilePath(Future<String?> result) async {
    final path = await result;
    if (path != null) {
      await _putSinglePath(path);
      ref.invalidateSelf();
    }
  }

  Future<void> putFilePaths(Future<FilePickerResult?> result) async {
    final res = await result;
    if (res != null) {
      for (var path in res.paths) {
        if (path == null) {
          continue;
        }
        await _putSinglePath(path);
      }
      ref.invalidateSelf();
    }
  }

  Future<(bool, String)> putAction({String? query, String? action}) async {
    final status = await siplicityServiceClient
        .putJob(PutJobRequest(query: query, action: action));
    while (true) {
      final done = await siplicityServiceClient
          .getStatus(GetStatusRequest(status: status.status));
      if (done.status != StatusType.STATUS_TYPE_WORKING) {
        ref.invalidateSelf();
        return (done.status == StatusType.STATUS_TYPE_DONE, done.message);
      }
      await Future.delayed(const Duration(milliseconds: 20));
    }
  }

  Future<void> linkRecords() async {
    await siplicityServiceClient.linkRecords(LinkRecordsRequest(
      id: -1,
      graph: GraphType.GRAPH_TYPE_OUTPUT,
      origin: GraphType.GRAPH_TYPE_INPUT,
      shift: true,
      records: Selection(id: ref.read(inputSelectionProvider)),
    ));
    ref.invalidate(inputSelectionProvider);
    ref.invalidate(outputRecordsProvider);
    ref.invalidateSelf();
  }

  Future<void> unlinkRecords() async {
    await siplicityServiceClient.unlinkRecords(UnlinkRecordsRequest(
      graph: GraphType.GRAPH_TYPE_INPUT,
      records: Selection(id: ref.read(inputSelectionProvider)),
    ));
    ref.invalidate(inputSelectionProvider);
    ref.invalidateSelf();
  }
}

@riverpod
class OutputRecords extends _$OutputRecords {
  @override
  Future<List<TreeViewItem>> build() async {
    final response = await siplicityServiceClient.listRecords(
        ListRecordsRequest(
            id: -1, graph: GraphType.GRAPH_TYPE_OUTPUT, display: true));
    final tvi = TreeViewItem(
        content: Text(response.name),
        value: response.id,
        children: addChildren(response.children));
    return <TreeViewItem>[
      tvi,
    ];
  }

  Future<(bool, String)> putAction({String? query, String? action}) async {
    final status = await siplicityServiceClient
        .putJob(PutJobRequest(query: query, action: action));
    while (true) {
      final done = await siplicityServiceClient
          .getStatus(GetStatusRequest(status: status.status));
      if (done.status != StatusType.STATUS_TYPE_WORKING) {
        ref.invalidateSelf();
        return (done.status == StatusType.STATUS_TYPE_DONE, done.message);
      }
      await Future.delayed(const Duration(milliseconds: 20));
    }
  }

  Future<void> linkRecords() async {
    await siplicityServiceClient.linkRecords(LinkRecordsRequest(
      id: -1,
      graph: GraphType.GRAPH_TYPE_INPUT,
      origin: GraphType.GRAPH_TYPE_OUTPUT,
      shift: true,
      records: Selection(id: ref.read(outputSelectionProvider)),
    ));
    ref.invalidate(outputSelectionProvider);
    ref.invalidate(inputRecordsProvider);
    ref.invalidateSelf();
  }

  Future<void> putOutputDir(Future<String?> result) async {
    final path = await result;
    if (path != null) {
      await siplicityServiceClient.updateField(UpdateFieldRequest(
          id: 2,
          overwrite: true,
          field_4: Field(
              namespace: "siplicity", name: "output_location", value: path)));
      ref.invalidateSelf();
    }
  }

  Future<void> flatten(int id) async {
    await siplicityServiceClient.editGraph(EditGraphRequest(
        typ: EditType.EDIT_TYPE_FLATTEN,
        id: id,
        graph: GraphType.GRAPH_TYPE_OUTPUT));
    ref.invalidateSelf();
  }

  Future<void> addParent(int id) async {
    await siplicityServiceClient.editGraph(EditGraphRequest(
        typ: EditType.EDIT_TYPE_NEW_PARENT,
        id: id,
        graph: GraphType.GRAPH_TYPE_OUTPUT,
        records: Selection(id: ref.read(outputSelectionProvider))));
    ref.invalidateSelf();
  }

  Future<void> moveUp(int id) async {
    await siplicityServiceClient.editGraph(EditGraphRequest(
        typ: EditType.EDIT_TYPE_MOVE_UP,
        id: id,
        graph: GraphType.GRAPH_TYPE_OUTPUT));
    ref.invalidateSelf();
  }

  Future<void> moveDown(int id) async {
    await siplicityServiceClient.editGraph(EditGraphRequest(
        typ: EditType.EDIT_TYPE_MOVE_DOWN,
        id: id,
        graph: GraphType.GRAPH_TYPE_OUTPUT));
    ref.invalidateSelf();
  }
}
