import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/dataentry/provider/dataentry_provider.dart';
import 'package:siplicity/dataentry/widgets/cells.dart';
import 'package:siplicity/dataentry/widgets/command_bar.dart';

const int pageSize = 100;

class DataEntryTable extends ConsumerWidget {
  const DataEntryTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countResponse = ref.watch(countEntriesProvider);
    return countResponse.when(
        error: (err, stack) => Text(err.toString()),
        loading: () => const Text(''),
        data: (cnt) {
          return Column(children: [
            DataEntryCommandBar(),
            Row(children: [
              DataEntryHeaderCell(width: 50, title: 'Type'),
              DataEntryHeaderCell(width: 400, title: 'Path'),
              DataEntryHeaderCell(width: 150, title: 'Contact'),
              DataEntryHeaderCell(width: 150, title: 'Title'),
            ]),
            Container(
                decoration: const BoxDecoration(
                    border: Border(
                  left: BorderSide(color: Color(0x0f000000)),
                )),
                child: ListView.builder(
                    itemCount: cnt,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final page = index ~/ pageSize + 1;
                      final indexInPage = index % pageSize;
                      final AsyncValue<List<List<String>>> response =
                          ref.watch(dataEntryProvider(page));
                      return response.when(
                          error: (err, stack) => Text(err.toString()),
                          loading: () => const Text(''),
                          data: (value) {
                            if (indexInPage >= value.length) {
                              return null;
                            }
                            final thisVal = value[indexInPage];
                            List<Widget> items = [
                              DataEntryTextCell(width: 50, text: thisVal[0]),
                              DataEntryTextCell(width: 400, text: thisVal[1]),
                            ];
                            for (var field in thisVal.skip(2)) {
                              items.add(DataEntryEditableCell(
                                  width: 150, text: field));
                            }
                            return IntrinsicHeight(
                                child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: items,
                            ));
                          });
                    }))
          ]);
        });
  }
}
