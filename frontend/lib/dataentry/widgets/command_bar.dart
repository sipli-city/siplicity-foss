import 'package:fluent_ui/fluent_ui.dart';

final class DataEntryCommandBar extends StatelessWidget {
  const DataEntryCommandBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: Color(0x0f000000)))),
        padding: const EdgeInsets.all(8.0),
        child: CommandBar(
          overflowBehavior: CommandBarOverflowBehavior.dynamicOverflow,
          primaryItems: [
            CommandBarBuilderItem(
              builder: (context, mode, w) => Tooltip(
                message: "Select graph",
                child: w,
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.graph_symbol),
                label: const Text('Select graph'),
                onPressed: () {},
              ),
            ),
            CommandBarBuilderItem(
              builder: (context, mode, w) => Tooltip(
                message: "Select metadata columns",
                child: w,
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.edit_table),
                label: const Text('Select fields'),
                onPressed: () {},
              ),
            ),
          ],
        ));
  }
}
