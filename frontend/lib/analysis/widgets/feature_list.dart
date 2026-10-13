import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/analysis/provider/features_provider.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

class FeatureList extends ConsumerWidget {
  final ReportType typ;
  const FeatureList({super.key, required this.typ});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final response = ref.watch(featuresProvider(report: typ));
    return switch (response) {
      AsyncData(:final value) => Container(
          width: 300,
          height: 300,
          alignment: Alignment.center,
          child: ListView(
            children: value.features
                .map((feat) => ListTile.selectable(
                    selectionMode: ListTileSelectionMode.multiple,
                    title: Text('${feat.value} (${feat.count})',
                        style: FluentTheme.of(context).typography.caption)))
                .toList(),
          )),
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