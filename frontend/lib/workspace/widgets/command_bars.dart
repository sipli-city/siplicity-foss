import 'package:file_picker/file_picker.dart';
import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/workspace/provider/workspace_provider.dart';

final addContentController = FlyoutController();
final inputActionController = FlyoutController();
final outputActionController = FlyoutController();

final class InputCommandBar extends ConsumerWidget {
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
              builder: (context, mode, w) => FlyoutTarget(
                controller: addContentController,
                child: w,
              ),
              wrappedItem: CommandBarButton(
                  icon: const Icon(FluentIcons.add),
                  label: const Text('Add content'),
                  onPressed: () {
                    addContentController.showFlyout(
                        autoModeConfiguration: FlyoutAutoConfiguration(
                          preferredMode: FlyoutPlacementMode.bottomCenter,
                        ),
                        barrierDismissible: true,
                        dismissOnPointerMoveAway: false,
                        dismissWithEsc: true,
                        builder: (context) {
                          return MenuFlyout(items: [
                            MenuFlyoutItem(
                              leading: const Icon(FluentIcons.search_and_apps),
                              text: const Text('Add local directory'),
                              onPressed: () {
                                final path = FilePicker.platform
                                    .getDirectoryPath(
                                        dialogTitle: "Add directory");
                                ref
                                    .read(inputRecordsProvider.notifier)
                                    .putFilePath(path);
                                Flyout.of(context).close();
                              },
                            ),
                            MenuFlyoutItem(
                              leading: const Icon(FluentIcons.search_and_apps),
                              text: const Text('Add local file(s)'),
                              onPressed: () {
                                final result = FilePicker.platform.pickFiles(
                                    allowMultiple: true,
                                    dialogTitle: "Add file(s)");
                                ref
                                    .read(inputRecordsProvider.notifier)
                                    .putFilePaths(result);
                                Flyout.of(context).close();
                              },
                            ),
                          ]);
                        });
                  }),
            ),
            CommandBarBuilderItem(
              builder: (context, mode, w) => Tooltip(
                message: "Remove selected records from workspace",
                child: w,
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.recycle_bin),
                label: const Text('Remove'),
                onPressed: () {
                  ref.read(inputRecordsProvider.notifier).unlinkRecords();
                },
              ),
            ),
            CommandBarBuilderItem(
                builder: (context, mode, w) => FlyoutTarget(
                      controller: inputActionController,
                      child: w,
                    ),
                wrappedItem: CommandBarButton(
                  icon: const Icon(FluentIcons.set_action),
                  label: const Text('Actions'),
                  onPressed: () {
                    inputActionController.showFlyout(
                      autoModeConfiguration: FlyoutAutoConfiguration(
                        preferredMode: FlyoutPlacementMode.bottomCenter,
                      ),
                      barrierDismissible: true,
                      dismissOnPointerMoveAway: false,
                      dismissWithEsc: true,
                      //navigatorKey: rootNavigatorKey.currentState, - https://medium.com/@moeinmoradi.dev/navigatorkey-in-flutter-ecbb81b8ad34
                      builder: (context) {
                        return MenuFlyout(items: [
                          MenuFlyoutItem(
                            leading: const Icon(FluentIcons.file_comment),
                            text: const Text('Identify with siegfried'),
                            onPressed: () async {
                              ref
                                  .read(inputRecordsProvider.notifier)
                                  .putAction(action: "siegfried");
                              Flyout.of(context).close();
                            },
                          ),
                          const MenuFlyoutSeparator(),
                          MenuFlyoutSubItem(
                              leading: const Icon(FluentIcons.tag),
                              text: const Text('Assign UUIDs'),
                              items: (_) => [
                                    MenuFlyoutItem(
                                      text: const Text('UUIDv4'),
                                      onPressed: () async {
                                        ref
                                            .read(inputRecordsProvider.notifier)
                                            .putAction(action: "uuid4");
                                        Flyout.of(context).close();
                                      },
                                    ),
                                    MenuFlyoutItem(
                                      text: const Text('UUIDv6'),
                                      onPressed: () async {
                                        ref
                                            .read(inputRecordsProvider.notifier)
                                            .putAction(action: "uuid6");
                                        Flyout.of(context).close();
                                      },
                                    ),
                                    MenuFlyoutItem(
                                      text: const Text('UUIDv7'),
                                      onPressed: () async {
                                        ref
                                            .read(inputRecordsProvider.notifier)
                                            .putAction(action: "uuid");
                                        Flyout.of(context).close();
                                      },
                                    ),
                                  ]),
                          const MenuFlyoutSeparator(),
                          MenuFlyoutSubItem(
                            leading: const Icon(FluentIcons.calculator),
                            text: const Text('Calculate checksums'),
                            items: (_) => [
                              MenuFlyoutItem(
                                text: const Text('SHA512'),
                                onPressed: () async {
                                  ref
                                      .read(inputRecordsProvider.notifier)
                                      .putAction(action: "sha512");
                                  Flyout.of(context).close();
                                },
                              ),
                              MenuFlyoutItem(
                                text: const Text('SHA256'),
                                onPressed: () async {
                                  ref
                                      .read(inputRecordsProvider.notifier)
                                      .putAction(action: "sha256");
                                  Flyout.of(context).close();
                                },
                              ),
                              MenuFlyoutItem(
                                text: const Text('SHA1'),
                                onPressed: () async {
                                  ref
                                      .read(inputRecordsProvider.notifier)
                                      .putAction(action: "sha1");
                                  Flyout.of(context).close();
                                },
                              ),
                              MenuFlyoutItem(
                                text: const Text('MD5'),
                                onPressed: () async {
                                  ref
                                      .read(inputRecordsProvider.notifier)
                                      .putAction(action: "md5");
                                  Flyout.of(context).close();
                                },
                              ),
                              MenuFlyoutItem(
                                text: const Text('CRC'),
                                onPressed: () async {
                                  ref
                                      .read(inputRecordsProvider.notifier)
                                      .putAction(action: "crc");
                                  Flyout.of(context).close();
                                },
                              ),
                              MenuFlyoutItem(
                                text: const Text('blake2b-512'),
                                onPressed: () async {
                                  ref
                                      .read(inputRecordsProvider.notifier)
                                      .putAction(action: "blake512");
                                  Flyout.of(context).close();
                                },
                              ),
                              MenuFlyoutItem(
                                text: const Text('blake2b-256'),
                                onPressed: () async {
                                  ref
                                      .read(inputRecordsProvider.notifier)
                                      .putAction(action: "blake256");
                                  Flyout.of(context).close();
                                },
                              ),
                              MenuFlyoutItem(
                                text: const Text('XXH64'),
                                onPressed: () async {
                                  ref
                                      .read(inputRecordsProvider.notifier)
                                      .putAction(action: "xx64");
                                  Flyout.of(context).close();
                                },
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
                  final outputdir = FilePicker.platform
                      .getDirectoryPath(dialogTitle: "Set output directory");
                  ref
                      .read(outputRecordsProvider.notifier)
                      .putOutputDir(outputdir);
                },
              ),
            ),
            CommandBarBuilderItem(
              builder: (context, mode, w) => FlyoutTarget(
                controller: outputActionController,
                child: w,
              ),
              wrappedItem: CommandBarButton(
                  icon: const Icon(FluentIcons.package),
                  label: const Text('Package'),
                  onPressed: () {
                    outputActionController.showFlyout(
                        autoModeConfiguration: FlyoutAutoConfiguration(
                          preferredMode: FlyoutPlacementMode.bottomCenter,
                        ),
                        barrierDismissible: true,
                        dismissOnPointerMoveAway: false,
                        dismissWithEsc: true,
                        builder: (context) {
                          return MenuFlyout(items: [
                            MenuFlyoutItem(
                              leading: const Icon(FluentIcons.suitcase),
                              text: const Text('Bagit'),
                              onPressed: () async {
                                ref
                                    .read(outputRecordsProvider.notifier)
                                    .putAction(action: "bagit");
                                Flyout.of(context).close();
                              },
                            ),
                          ]);
                        });
                  }),
            ),
            CommandBarButton(
              icon: const Icon(FluentIcons.fabric_folder_confirm),
              label: const Text('Commit'),
              onPressed: () async {
                ref
                    .read(outputRecordsProvider.notifier)
                    .putAction(action: "commit");
              },
            ),
          ],
        ));
  }
}
