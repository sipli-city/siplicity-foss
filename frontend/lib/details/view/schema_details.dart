import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/details/provider/fieldpaths_provider.dart';
import 'package:siplicity/details/provider/recorddetails_provider.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

class SchemaDetails extends ConsumerStatefulWidget {
  const SchemaDetails({super.key});
  @override
  SchemaDetailsState createState() => SchemaDetailsState();
}

class SchemaDetailsState extends ConsumerState<SchemaDetails> {
  static const int schemaID = 0;

  List<List<(String, String, int)>> _fieldselection = [];

  bool isSelected(List<(String, String, int)> value) {
    outer:
    for (var li in _fieldselection) {
      if (li.length != value.length) continue;
      var i = 0;
      for (var rec in li) {
        if (rec != value[i]) continue outer;
        i++;
      }
      return true;
    }
    return false;
  }

  int indexSelected(List<(String, String, int)> value) {
    int j = 0;
    outer:
    for (var li in _fieldselection) {
      if (li.length != value.length) {
        j++;
        continue;
      }
      var i = 0;
      for (var rec in li) {
        if (rec != value[i]) {
          j++;
          continue outer;
        }
        i++;
      }
      return j;
    }
    return 0;
  }

  void selectionChanged(bool? selected, List<(String, String, int)> value) {
    selected ??= false;
    selected
        ? _fieldselection.add(value)
        : _fieldselection.removeAt(indexSelected(value));
  }

  @override
  void initState() {
    super.initState();
    _fieldselection = ref.read(fieldpathsProvider.notifier).asSelection();
  }

  @override
  Widget build(BuildContext context) {
    final details = ref.watch(recordDetailsProvider(schemaID));

    return switch (details) {
      AsyncData(:final value) => ContentDialog(
          constraints: const BoxConstraints(minWidth: 10),
          title: const Text('Schema'),
          content: SingleChildScrollView(
            child: TreeView(
              selectionMode: TreeViewSelectionMode.multiple,
              shrinkWrap: true,
              items: addChildren(value.metadata, {}, []),
              onItemInvoked: (item, details) async {
                if (details == TreeViewItemInvokeReason.selectionToggle) {
                  selectionChanged(item.selected, item.value);
                }
              },
              onSelectionChanged: (selectedItems) async {},
              onSecondaryTap: (item, details) async {},
            ),
          ),
          actions: [
            Align(
                alignment: Alignment.bottomLeft,
                child: FilledButton(
                  child: const Text('Confirm selection'),
                  onPressed: () {
                    ref
                        .read(fieldpathsProvider.notifier)
                        .confirmSelection(_fieldselection);
                    Navigator.pop(context, 'User canceled dialog');
                  },
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
      AsyncError(:final error) => Text('error: $error'),
      _ => const Text('loading...'),
    };
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

  List<TreeViewItem> addChildren(List<Metadata> metadata,
      Map<(String, String), int> indexes, List<(String, String, int)> parents) {
    return metadata.map((item) {
      indexes.update(
        (item.field_1.namespace, item.field_1.name),
        (value) => ++value,
        ifAbsent: () => 0,
      );
      final val = [...parents];
      val.add((
        item.field_1.namespace,
        item.field_1.name,
        indexes[(item.field_1.namespace, item.field_1.name)]!,
      ));
      return TreeViewItem(
          selected: isSelected(val),
          content: metadataInput(
              namespace: item.field_1.namespace,
              name: item.field_1.name,
              value: item.field_1.value),
          value: val,
          children: addChildren(item.children, indexes, val));
    }).toList();
  }
}
