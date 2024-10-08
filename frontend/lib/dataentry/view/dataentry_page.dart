import 'package:fluent_ui/fluent_ui.dart';

const contacts = ['Kendall', 'Collins'];

const paths = ['//here//there', '//everywhere'];

const typs = ['folder', 'file'];

const titles = ['a tale of two cities', 'fruits'];

class DataEntryPage extends StatelessWidget {
  const DataEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
              Expanded(flex: 1, child: Text('Type')),
              Expanded(flex: 1, child: Text('Path')),
              Expanded(flex: 1, child: Text('Contact')),
              Expanded(flex: 1, child: Text('Title')),
            ]
      ),
      ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Expanded(flex: 1, child: Text(typs[index])),
              Expanded(flex: 1, child: Text(paths[index])),
              Expanded(flex: 1, child: Text(contacts[index])),
              Expanded(flex: 1, child: Text(titles[index])),
            ]
          );
        })]);
  }
}
