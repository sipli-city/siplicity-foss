import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siplicity/dataentry/provider/dataentry_provider.dart';
import 'package:siplicity/dataentry/widgets/cells.dart';

import 'package:siplicity/details/provider/fieldpaths_provider.dart';

const int pageSize = 100;

class DataEntryTable extends ConsumerWidget {
  const DataEntryTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double height = MediaQuery.sizeOf(context).height - 140;
    final countResponse = ref.watch(countEntriesProvider);
    List<DataEntryHeaderCell> headings = [
      DataEntryHeaderCell(width: 50, title: 'Type'),
      DataEntryHeaderCell(width: 400, title: 'Path'),
    ];
    for (var title in ref.read(fieldpathsProvider.notifier).asTitles()) {
      headings.add(DataEntryHeaderCell(width: 200, title: title));
    }
    return countResponse.when(
        error: (err, stack) => Text(err.toString()),
        loading: () => const Text(''),
        data: (cnt) {
          return Container(
              padding: EdgeInsets.all(8.0),
              child: Column(children: [
                Row(children: headings),
                Container(
                    height: height,
                    decoration: const BoxDecoration(
                        border: Border(
                      left: BorderSide(color: Color(0x0f000000)),
                    )),
                    child: CustomScrollView(slivers: [
                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final page = index ~/ pageSize + 1;
                          final indexInPage = index % pageSize;
                          final AsyncValue<List<(int, List<String>)>> response =
                              ref.watch(dataEntryProvider(page));
                          return response.when(
                              error: (err, stack) => Text(err.toString()),
                              loading: () => const Text(''),
                              data: (value) {
                                if (indexInPage >= value.length) {
                                  return null;
                                }
                                final thisVal = value[indexInPage].$2;
                                List<Widget> items = [
                                  DataEntryTextCell(
                                      width: 50, text: thisVal[0]),
                                  DataEntryTextCell(
                                      width: 400, text: thisVal[1]),
                                ];
                                int i = 0;
                                for (var field in thisVal.skip(2)) {
                                  items.add(DataEntryEditableCell(
                                      width: 200,
                                      text: field,
                                      id: value[indexInPage].$1,
                                      index: i));
                                  i++;
                                }
                                return IntrinsicHeight(
                                    child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: items,
                                ));
                              });
                        },
                        childCount: cnt,
                      ))
                    ]))
              ]));
        });
  }
}
