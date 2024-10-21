import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/details/provider/recorddetails_provider.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

class SchemaDetails extends ConsumerWidget {
  static const int item = 0; // SCHEMA record
  const SchemaDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final details = ref.watch(recordDetailsProvider(item));

    return switch (details) {
      AsyncData(:final value) => ContentDialog(
          constraints: const BoxConstraints(minWidth: 10),
          title: const Text('Schema'),
          content: SingleChildScrollView(
            child: TreeView(
              selectionMode: TreeViewSelectionMode.multiple,
              shrinkWrap: true,
              items: addChildren(value.metadata, {}),
              onItemInvoked: (item, details) async {},
              onSelectionChanged: (selectedItems) async {},
              onSecondaryTap: (item, details) async {},
            ),
          ),
          actions: [
            Align(
                alignment: Alignment.bottomLeft,
                child: FilledButton(
                  child: const Text('Confirm selection'),
                  onPressed: () =>
                      Navigator.pop(context, 'User canceled dialog'),
                )),
            Align(
                alignment: Alignment.bottomRight,
                child: FilledButton(
                  child: const Text('Cancel selection'),
                  onPressed: () =>
                      Navigator.pop(context, 'User canceled dialog'),
                ))
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

List<TreeViewItem> addChildren(
    List<Metadata> metadata, Map<(String, String), int> indexes) {
  return metadata.map((item) {
    indexes.update(
      (item.field_1.namespace, item.field_1.name),
      (value) => ++value,
      ifAbsent: () => 0,
    );
    return TreeViewItem(
        content: metadataInput(
            namespace: item.field_1.namespace,
            name: item.field_1.name,
            value: item.field_1.value),
        value: (
          item.field_1.namespace,
          item.field_1.name,
          indexes[(item.field_1.namespace, item.field_1.name)],
        ), // Record of (namespace, name, index). Get path by making a list of these by going up item tree.
        children: addChildren(item.children, indexes));
  }).toList();
}
