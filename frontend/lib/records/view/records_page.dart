import 'package:fluent_ui/fluent_ui.dart';
import 'package:file_picker/file_picker.dart';
import 'package:siplicity/records/records.dart';

class RecordsPage extends ConsumerWidget {
  /// {@macro records_page}
  const RecordsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScaffoldPage(
        padding: EdgeInsets.zero,
        header: Container(
          color: FluentTheme.of(context).activeColor,
          padding: const EdgeInsets.all(12.0),
          child: CommandBar(
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
          ),
        ),
        content: SingleChildScrollView(
            child: Container(
                color: FluentTheme.of(context).activeColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Expanded(child: InputRecordsBody()),
                    Column(children: [
                      IconButton(
                        icon: const Icon(FluentIcons.double_chevron_right,
                            size: 24.0),
                        onPressed: () => debugPrint('pressed button'),
                      ),
                      IconButton(
                        icon: const Icon(FluentIcons.double_chevron_left,
                            size: 24.0),
                        onPressed: () => debugPrint('pressed button'),
                      ),
                    ]),
                    const Expanded(child: OutputRecordsBody()),
                  ],
                ))));
  }
}
