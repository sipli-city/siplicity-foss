import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/dataentry/widgets/table.dart';

class DataEntryPage extends StatelessWidget {
  const DataEntryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8.0), child: DataEntryTable());
  }
}
