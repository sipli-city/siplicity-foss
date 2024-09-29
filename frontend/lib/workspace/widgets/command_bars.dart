import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/workspace/provider/workspace_provider.dart';

final menuController = FlyoutController();

class InputCommandBar extends ConsumerWidget {
  const InputCommandBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0x0f000000)))),
        padding: const EdgeInsets.all(8.0),
        child: CommandBar(
          overflowBehavior: CommandBarOverflowBehavior.dynamicOverflow,
          primaryItems: <CommandBarItem>[
            CommandBarBuilderItem(
              builder: (context, mode, w) => Tooltip(
                message: "Add a directory",
                child: w,
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.add),
                label: const Text('Add directory'),
                onPressed: () {
                  final path = FilePicker.platform
                      .getDirectoryPath(dialogTitle: "Add directory");
                  ref.read(inputRecordsProvider.notifier).putFilePath(path);
                },
              ),
            ),
            CommandBarBuilderItem(
              builder: (context, mode, w) => Tooltip(
                message: "Add file(s)",
                child: w,
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.add),
                label: const Text('Add file(s)'),
                onPressed: () {
                  final result = FilePicker.platform.pickFiles(
                      allowMultiple: true, dialogTitle: "Add file(s)");
                  ref.read(inputRecordsProvider.notifier).putFilePaths(result);
                },
              ),
            ),
            CommandBarBuilderItem(
              builder: (context, mode, w) => Tooltip(
                message: "Remove selected records from workspace",
                child: w,
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.recycle_bin),
                label: const Text('Remove'),
                onPressed: () {},
              ),
            ),
            CommandBarBuilderItem(
                builder: (context, mode, w) => FlyoutTarget(
                      controller: menuController,
                      child: w,
                    ),
                wrappedItem: CommandBarButton(
                  icon: const Icon(FluentIcons.developer_tools),
                  label: const Text('Actions'),
                  onPressed: () {
                    menuController.showFlyout(
                      autoModeConfiguration: FlyoutAutoConfiguration(
                        preferredMode: FlyoutPlacementMode.topCenter,
                      ),
                      barrierDismissible: true,
                      dismissOnPointerMoveAway: false,
                      dismissWithEsc: true,
                      //navigatorKey: rootNavigatorKey.currentState, - https://medium.com/@moeinmoradi.dev/navigatorkey-in-flutter-ecbb81b8ad34
                      builder: (context) {
                        return MenuFlyout(items: [
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.search_and_apps),
                            text: const Text('Identify with siegfried'),
                            onPressed: Flyout.of(context).close,
                          ),
                          const MenuFlyoutSeparator(),
                          MenuFlyoutSubItem(
                            leading: const Icon(FluentIcons.calculator),
                            text: const Text('Calculate checksums'),
                            items: (_) => [
                              MenuFlyoutItem(
                                text: const Text('SHA512'),
                                onPressed: Flyout.of(context).close,
                              ),
                              MenuFlyoutItem(
                                text: const Text('SHA256'),
                                onPressed: Flyout.of(context).close,
                              ),
                              MenuFlyoutItem(
                                text: const Text('SHA1'),
                                onPressed: Flyout.of(context).close,
                              ),
                              MenuFlyoutItem(
                                text: const Text('MD5'),
                                onPressed: Flyout.of(context).close,
                              ),
                              MenuFlyoutItem(
                                text: const Text('CRC'),
                                onPressed: Flyout.of(context).close,
                              ),
                              MenuFlyoutItem(
                                text: const Text('blake2b-512'),
                                onPressed: Flyout.of(context).close,
                              ),
                              MenuFlyoutItem(
                                text: const Text('blake2b-256'),
                                onPressed: Flyout.of(context).close,
                              ),
                              MenuFlyoutItem(
                                text: const Text('XXH64'),
                                onPressed: Flyout.of(context).close,
                              ),
                            ],
                          ),
                        ]);
                      },
                    );
                  },
                )),
          ],
        ));
  }
}

class OutputCommandBar extends ConsumerWidget {
  const OutputCommandBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0x0f000000)))),
        padding: const EdgeInsets.all(8.0),
        child: CommandBar(
          overflowBehavior: CommandBarOverflowBehavior.dynamicOverflow,
          primaryItems: <CommandBarItem>[
            CommandBarBuilderItem(
              builder: (context, mode, w) => Tooltip(
                message: "Set output directory",
                child: w,
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.add),
                label: const Text('Set output directory'),
                onPressed: () {
                  final _ = FilePicker.platform
                      .getDirectoryPath(dialogTitle: "Set output directory");
                },
              ),
            ),
            CommandBarButton(
              icon: const Icon(FluentIcons.developer_tools),
              label: const Text('Actions'),
              onPressed: () {},
            ),
            CommandBarButton(
              icon: const Icon(FluentIcons.fabric_folder_confirm),
              label: const Text('Commit'),
              onPressed: () {},
            ),
          ],
        ));
  }
}
