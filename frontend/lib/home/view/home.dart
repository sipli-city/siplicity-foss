import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/dataentry/view/dataentry_page.dart';
import 'package:siplicity/home/provider/pane_provider.dart';
import 'package:siplicity/workspace/view/workspace_page.dart';
import 'package:siplicity/analysis/view/analysis_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return NavigationView(
        transitionBuilder: (child, animation) {
          return SuppressPageTransition(child: child);
        },
        pane: NavigationPane(
            displayMode: PaneDisplayMode.top,
            selected: ref.watch(paneSelectionProvider),
            onItemPressed: (index) =>
                ref.read(paneSelectionProvider.notifier).paneChanged(index),
            items: [
              PaneItem(
                icon: const Icon(FluentIcons.home),
                title: const Text('Workspace'),
                body: const RecordsPage(),
              ),
              PaneItemSeparator(),
              PaneItem(
                icon: const Icon(FluentIcons.pie_double),
                title: const Text('Analysis'),
                body: const AnalysisPage(),
              ),
              PaneItemSeparator(),
              PaneItem(
                icon: const Icon(FluentIcons.add_table),
                title: const Text('Data entry'),
                body: const DataEntryPage(),
              ),
            ],
            footerItems: [
              PaneItem(
                icon: const Icon(FluentIcons.settings),
                title: const Text('Settings'),
                body: const Text("Todo"),
              ),
            ]));
  }
}
