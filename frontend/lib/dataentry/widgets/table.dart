import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/dataentry/widgets/cells.dart';

const contacts = ['Kendall', 'Collins'];

const paths = [
  '//here//there//over_the_fields//awaywego//all_along//the//merrygoround',
  '//everywhere'
];

const typs = ['folder', 'file'];

const titles = ['a tale of two cities', 'fruits'];

class DataEntryTable extends StatelessWidget {
  const DataEntryTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(children: [
        DataEntryHeaderCell(width: 50, title: 'Type'),
        DataEntryHeaderCell(width: 200, title: 'Path'),
        DataEntryHeaderCell(width: 150, title: 'Contact'),
        DataEntryHeaderCell(width: 150, title: 'Title'),
      ]),
      Container(
          decoration: const BoxDecoration(
              border: Border(
            left: BorderSide(color: Color(0x0f000000)),
          )),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                return IntrinsicHeight(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      DataEntryTextCell(width: 50, text: typs[index]),
                      DataEntryTextCell(width: 200, text: paths[index]),
                      DataEntryEditableCell(width: 150, text: contacts[index]),
                      DataEntryEditableCell(width: 150, text: titles[index]),
                    ]));
              }))
    ]);
  }
}
