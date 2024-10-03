import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/workspace/provider/recorddetails_provider.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

class RecordDetails extends ConsumerWidget {
  final int item;
  const RecordDetails({super.key, required this.item});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(recordDetailsProvider(item));

    return switch (details) {
      AsyncData(:final value) => ContentDialog(
          constraints: const BoxConstraints(minWidth: 10),
          title: const Text('Record details'),
          content: Column(children: [
            InfoLabel(
              label: 'Type',
              child: TextBox(
                placeholder: value.typ.name,
                readOnly: true,
              ),
            ),
            InfoLabel(
              label: 'Path',
              child: TextBox(
                placeholder: value.path,
                readOnly: true,
              ),
            ),
            InfoLabel(
              label: 'Size',
              child: TextBox(
                placeholder: value.size.toString(),
                readOnly: true,
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
                child: Text("Metadata",
                    style: FluentTheme.of(context).typography.subtitle)),
            Expanded(
                child: SingleChildScrollView(
              controller: ScrollController(),
              scrollDirection: Axis.vertical,
              child: TreeView(
                shrinkWrap: true,
                items: addChildren(value.metadata),
                onItemInvoked: (item, details) async {},
                onSelectionChanged: (selectedItems) async {},
                onSecondaryTap: (item, details) async {},
              ),
            )),
          ]),
          actions: [
            FilledButton(
              child: const Text('Close'),
              onPressed: () => Navigator.pop(context, 'User canceled dialog'),
            ),
          ],
        ),
      _ => const Text('loading'),
    };
  }
}

InfoLabel metadataInput(
    {String? namespace, required String name, String? value}) {
  String label = name;
  if (namespace != null) label = "$name ($namespace)";
  if (value != null && value.isNotEmpty) {
    return InfoLabel(
        label: label,
        child: TextBox(
          placeholder: value,
        ));
  }
  return InfoLabel(label: label);
}

List<TreeViewItem> addChildren(List<Metadata> metadata) {
  return metadata
      .map((item) => TreeViewItem(
          content: metadataInput(
              namespace: item.field_1.namespace,
              name: item.field_1.name,
              value: item.field_1.value),
          children: addChildren(item.children)))
      .toList();
}
