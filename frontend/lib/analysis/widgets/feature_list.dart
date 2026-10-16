import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/analysis/provider/features_provider.dart';
import 'package:siplicity/home/provider/pane_provider.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';
import 'package:siplicity/workspace/provider/workspace_provider.dart';

class FeatureList extends ConsumerStatefulWidget {
  final ReportType typ;
  const FeatureList({super.key, required this.typ});
  @override
  FeatureListState createState() => FeatureListState();
}

class FeatureListState extends ConsumerState<FeatureList> {
  final List<String> _featuresselection = [];

  bool isSelected(String value) {
    return _featuresselection.contains(value);
  }

  void selectionChanged(bool selected, String value) {
    selected ? _featuresselection.add(value) : _featuresselection.remove(value);
  }

  String? asQuery() {
    if (_featuresselection.isEmpty) return null;
    String query = switch (widget.typ) {
      ReportType.REPORT_TYPE_SIZES => "Sizes",
      ReportType.REPORT_TYPE_EXTENSIONS => "Extension",
      ReportType.REPORT_TYPE_MODIFIED => "Modified",
      ReportType.REPORT_TYPE_FILE_FORMAT => "Format",
      ReportType.REPORT_TYPE_FORMAT_CLASS => "Class",
      ReportType.REPORT_TYPE_MIME_TYPE => "Mime",
      ReportType.REPORT_TYPE_DUPLICATES => "Duplicates",
      ReportType.REPORT_TYPE_MULTIPLE_IDENTIFICATION => "MultipleID",
      _ => "",
    };
    return "$query=${_featuresselection.join(",")}";
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final response = ref.watch(featuresProvider(report: widget.typ));
    return switch (response) {
      AsyncData(:final value) => Column(children: [
          Container(
              width: 300,
              height: 250,
              alignment: Alignment.center,
              child: ListView(
                children: value.features
                    .map((feat) => ListTile.selectable(
                        selectionMode: ListTileSelectionMode.multiple,
                        selected: isSelected(feat.value),
                        onSelectionChange: (selected) {
                          setState(() {
                            selectionChanged(selected, feat.value);
                          });
                        },
                        title: Text('${feat.value} (${feat.count})',
                            style: FluentTheme.of(context).typography.caption)))
                    .toList(),
              )),
          Container(
              width: 200,
              height: 50,
              alignment: Alignment.bottomLeft,
              child: Button(
                onPressed: () {
                  ref
                      .read(queryRecordsProvider.notifier)
                      .updateQuery(asQuery());
                  ref.read(paneSelectionProvider.notifier).paneChanged(0);
                },
                child: const Text('Query selection'),
              ))
        ]),
      _ => const Text("loading"),
    };
  }
}
/*
ListView.builder(
  itemCount: contacts.length,
  itemBuilder: (context, index) {
    final contact = contacts[index];
    return ListTile.selectable(
      title: Text(contact),
      selected: selectedContacts.contains(contact),
      selectionMode: ListTileSelectionMode.multiple,
      onSelectionChange: (selected) {
        setState(() {
          if (selected) {
            selectedContacts.add(contact);
          } else {
            selectedContacts.remove(contact);
          }
        });
      },
    );
  } 
),*/