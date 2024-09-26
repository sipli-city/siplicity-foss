import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/records/records.dart';
import 'package:siplicity/records/view/records_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int choice = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationView(
        pane: NavigationPane(
            displayMode: PaneDisplayMode.top,
            selected: choice,
            onItemPressed: (index) => setState(() {
                  choice = index;
                }),
            items: [
          PaneItem(
            icon: const Icon(FluentIcons.home),
            title: const Text('Workspace'),
            body: const RecordsPage(),
          ),
          PaneItemSeparator(),
          PaneItem(
            icon: const Icon(FluentIcons.issue_tracking),
            title: const Text('Analysis'),
            body: const Text("Todo"),
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
