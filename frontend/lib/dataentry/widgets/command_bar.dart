import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/details/view/schema_details.dart';
import 'package:siplicity/dataentry/widgets/filter.dart';

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
                message: "Choose a subset of records",
                child: w,
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.page_list_filter),
                label: const Text('Filter'),
                onPressed: () async {
                  await showDialog<String>(
                      context: context,
                      builder: (context) => FilterSelection());
                },
              ),
            ),
            CommandBarBuilderItem(
              builder: (context, mode, w) => Tooltip(
                message: "Define metadata columns",
                child: w,
              ),
              wrappedItem: CommandBarButton(
                icon: const Icon(FluentIcons.edit_table),
                label: const Text('Choose fields'),
                onPressed: () async {
                  await showDialog<String>(
                      context: context, builder: (context) => SchemaDetails());
                },
              ),
            ),
          ],
        ));
  }
}
