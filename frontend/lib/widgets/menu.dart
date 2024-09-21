import 'package:fluent_ui/fluent_ui.dart';
import 'package:file_picker/file_picker.dart';

final simpleCommandBarItems = <CommandBarItem>[
  CommandBarBuilderItem(
    builder: (context, mode, w) => Tooltip(
      message: "Add files or directories",
      child: w,
    ),
    wrappedItem: CommandBarButton(
      icon: const Icon(FluentIcons.add),
      label: const Text('Add'),
      onPressed: () {
        FilePicker.platform.getDirectoryPath();
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
      onPressed: () {},
    ),
  ),
  CommandBarButton(
    icon: const Icon(FluentIcons.move),
    label: const Text('Move'),
    onPressed: () {},
  ),
  CommandBarButton(
    icon: const Icon(FluentIcons.activity_feed),
    label: const Text('Action'),
    onPressed: () {},
  ),
  CommandBarButton(
    icon: const Icon(FluentIcons.confirm_event),
    label: const Text('Commit'),
    onPressed: () {},
  ),
];

CommandBar myCommandBar() {
  return CommandBar(
    overflowBehavior: CommandBarOverflowBehavior.noWrap,
    primaryItems: simpleCommandBarItems,
  );
}
