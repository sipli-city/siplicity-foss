import 'package:fluent_ui/fluent_ui.dart';

const contacts = ['Kendall', 'Collins'];

class DataEntryPage extends StatelessWidget {
  const DataEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile.selectable(
            title: Text(contact),
            selected: false,
            selectionMode: ListTileSelectionMode.multiple,
            onSelectionChange: (selected) {},
          );
        });
  }
}
