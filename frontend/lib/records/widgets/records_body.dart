import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/records/provider/provider.dart';

class RecordsBody extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(recordsProvider);
    return switch (records) {
      AsyncData(:final value) => TreeView(items: value),
      _ => const Text('loading'),
    };
  }
}
