import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/dataentry/widgets/table.dart';
import 'package:siplicity/dataentry/widgets/command_bar.dart';

class DataEntryPage extends StatelessWidget {
  const DataEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      DataEntryCommandBar(),
      DataEntryTable(),
    ]);
  }
}
