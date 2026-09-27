import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/workspace/provider/workspace_provider.dart';

class TreeMenu extends StatelessWidget {
  const TreeMenu({
    super.key,
    required this.heading,
    required this.actions,
  });

  final String heading;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(constraints: const BoxConstraints(minWidth: 40.0), child: Title(color: FluentTheme.of(context).activeColor, child: Text(heading))),
        ...actions,
      ],
    );
  }
}

Future<void> putFiles(Future<FilePickerResult?> result, WidgetRef ref) async {
  final res = await result;
  if (res != null) {
    ref.read(inputRecordsProvider.notifier).putFilePaths(res.paths);
  } 
}

class InputCommandBar extends ConsumerWidget {
  const InputCommandBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TreeMenu(heading: 'Input', actions: [
      DropDownButton(
  title: const Text('Add'),
  items: [
    MenuFlyoutItem(
      text: const Text('Add local files'), 
      onPressed: () {
      final result = FilePicker.platform.pickFiles();
      putFiles(result, ref);
    },
    ),
    //const MenuFlyoutSeparator(),
    //MenuFlyoutItem(text: const Text('Add remote bucket'), onPressed: () {}),
  ],
  ),
    ]);
  }
}

/*
class InputCommandBar extends ConsumerWidget {
  const InputCommandBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  return CommandBar(
            overflowBehavior: CommandBarOverflowBehavior.noWrap,
            primaryItems: <CommandBarItem>[
              CommandBarBuilderItem(
                builder: (context, mode, w) => Tooltip(
                  message: "Add files or directories",
                  child: w,
                ),
                wrappedItem: CommandBarButton(
                  icon: const Icon(FluentIcons.add),
                  label: const Text('Add'),
                  onPressed: () {
                    final path = FilePicker.platform.getDirectoryPath();
                    ref.read(inputRecordsProvider.notifier).putFilePath(path);
                  },
                ),
              ),
              CommandBarBuilderItem(
                builder: (context, mode, w) => Tooltip(
                  message: "Delete what is currently selected!",
                  child: w,
                ),
                wrappedItem: CommandBarButton(
                  icon: const Icon(FluentIcons.delete),
                  label: const Text('Delete'),
                  onPressed: () {
                    ref
                        .read(inputRecordsProvider.notifier)
                        .putAction(filter: "*", action: "siegfried");
                  },
                ),
              ),
              CommandBarButton(
                icon: const Icon(FluentIcons.move),
                label: const Text('Identify'),
                onPressed: () {},
              ),
              CommandBarButton(
                icon: const Icon(FluentIcons.activity_feed),
                label: const Text('Bagit'),
                onPressed: () {
                  ref
                      .read(outputRecordsProvider.notifier)
                      .putAction(filter: "fmt/19", action: "bagit");
                },
              ),
              CommandBarButton(
                icon: const Icon(FluentIcons.confirm_event),
                label: const Text('Commit'),
                onPressed: () {},
              ),
            ],
          );
  }
}*/