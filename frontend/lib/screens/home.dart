import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/widgets/output_tree.dart';
import 'package:siplicity/records/widgets/records_body.dart';
import '../widgets/menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  List<Tab> tabs = [];

  TabWidthBehavior tabWidthBehavior = TabWidthBehavior.equal;
  CloseButtonVisibilityMode closeButtonVisibilityMode =
      CloseButtonVisibilityMode.always;
  bool showScrollButtons = true;
  bool wheelScroll = false;

  Tab generateTab(int index) {
    final allIcons = FluentIcons.allIcons.values;
    late Tab tab;
    tab = Tab(
      text: Text('Workspace $index'),
      semanticLabel: 'Workspace #$index',
      icon: Icon(allIcons.elementAt(4)),
      body: ScaffoldPage(
          padding: EdgeInsets.zero,
          header: Container(
            color: FluentTheme.of(context).activeColor,
            padding: const EdgeInsets.all(12.0),
            child: myCommandBar(),
          ),
          content: SingleChildScrollView(
              child: Container(
                  color: FluentTheme.of(context).activeColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: RecordsBody()),
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
                      Expanded(child: TreeView(items: outputTreeViewItems)),
                    ],
                  )))),
      onClosed: () {
        setState(() {
          tabs.remove(tab);
          if (currentIndex > 0) currentIndex--;
        });
      },
    );
    return tab;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: FluentTheme.of(context).inactiveBackgroundColor,
        child: TabView(
            tabs: tabs,
            currentIndex: currentIndex,
            onChanged: (index) => setState(() => currentIndex = index),
            tabWidthBehavior: tabWidthBehavior,
            closeButtonVisibility: closeButtonVisibilityMode,
            showScrollButtons: showScrollButtons,
            onNewPressed: () {
              setState(() {
                final index = tabs.length + 1;
                final tab = generateTab(index);
                tabs.add(tab);
              });
            },
            onReorder: (oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                }
                final item = tabs.removeAt(oldIndex);
                tabs.insert(newIndex, item);

                if (currentIndex == newIndex) {
                  currentIndex = oldIndex;
                } else if (currentIndex == oldIndex) {
                  currentIndex = newIndex;
                }
              });
            }));
  }
}
