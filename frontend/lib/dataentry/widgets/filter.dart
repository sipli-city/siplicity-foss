import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/dataentry/provider/filter_provider.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

class FilterSelection extends ConsumerStatefulWidget {
  const FilterSelection({super.key});
  @override
  FilterSelectionState createState() => FilterSelectionState();
}

class FilterSelectionState extends ConsumerState<FilterSelection> {
  GraphType _typ = GraphType.GRAPH_TYPE_INPUT;
  int _rectyp = 0;
  String? _query;

  @override
  void initState() {
    super.initState();
    _typ = ref.read(graphTypProvider);
    _query = ref.read(queryStringProvider);
    _rectyp = ref.read(recordTypesProvider.notifier).asInt();
  }

  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      constraints: BoxConstraints(maxHeight: 350, maxWidth: 300),
      title: const Text('Filter list'),
      content: Column(children: [
        Align(
            alignment: Alignment.bottomLeft,
            child: InfoLabel(
              label: 'Graph',
              child: ComboBox<GraphType>(
                value: _typ,
                items: [
                  ComboBoxItem(
                    value: GraphType.GRAPH_TYPE_INPUT,
                    child: const Text("Input Graph"),
                  ),
                  ComboBoxItem(
                    value: GraphType.GRAPH_TYPE_OUTPUT,
                    child: const Text("Output Graph"),
                  )
                ],
                onChanged: (typ) =>
                    setState(() => _typ = typ ?? GraphType.GRAPH_TYPE_INPUT),
              ),
            )),
        Align(
            alignment: Alignment.bottomLeft,
            child: InfoLabel(
              label: 'Record Types',
              child: ComboBox<int>(
                value: _rectyp,
                items: [
                  ComboBoxItem(
                    value: 0,
                    child: const Text("Files and folders"),
                  ),
                  ComboBoxItem(
                    value: 1,
                    child: const Text("Files only"),
                  ),
                  ComboBoxItem(
                    value: 2,
                    child: const Text("Folders only"),
                  )
                ],
                onChanged: (typ) => setState(() => _rectyp = typ ?? 0),
              ),
            )),
        InfoLabel(
          label: 'Query',
          child: TextBox(
            controller: TextEditingController.fromValue(TextEditingValue(
                text: _query ?? "",
                selection: TextSelection(
                  baseOffset: _query?.length ?? 0,
                  extentOffset: _query?.length ?? 0,
                ))),
            placeholder: _query == null ? "E.g. Extension=jpg" : "",
            onChanged: (value) =>
                setState(() => value.isEmpty ? _query = null : _query = value),
          ),
        ),
      ]),
      actions: [
        FilledButton(
          child: const Text('Confirm'),
          onPressed: () {
            ref.read(graphTypProvider.notifier).set(_typ);
            ref.read(recordTypesProvider.notifier).set(_rectyp);
            ref.read(queryStringProvider.notifier).set(_query);
            Navigator.pop(context, 'Confirmed');
            // Delete file here
          },
        ),
        FilledButton(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context, 'Cancelled'),
        ),
      ],
    );
  }
}
