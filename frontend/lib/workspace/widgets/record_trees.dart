import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/workspace/provider/workspace_provider.dart';

class InputRecordsTree extends ConsumerWidget {
  const InputRecordsTree({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(inputRecordsProvider);
    return switch (records) {
      AsyncData(:final value) => TreeView(
          selectionMode: TreeViewSelectionMode.multiple,
          shrinkWrap: true,
          items: value,
          onItemInvoked: (item, details) async {},
          onSelectionChanged: (selectedItems) async {},
          onSecondaryTap: (item, details) async {},
        ),
      _ => const Text('loading'),
    };
  }
}

class OutputRecordsTree extends ConsumerWidget {
  const OutputRecordsTree({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(outputRecordsProvider);
    return switch (records) {
      AsyncData(:final value) => TreeView(
          selectionMode: TreeViewSelectionMode.multiple,
          shrinkWrap: true,
          items: value,
          onItemInvoked: (item, details) async {},
          onSelectionChanged: (selectedItems) async {},
          onSecondaryTap: (item, details) async {},
        ),
      _ => const Text('loading'),
    };
  }
}
