import 'package:fluent_ui/fluent_ui.dart';
import 'package:siplicity/records/provider/provider.dart';

class InputRecordsBody extends ConsumerWidget {
  const InputRecordsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(inputRecordsProvider);
    return switch (records) {
      AsyncData(:final value) => TreeView(items: value),
      _ => const Text('loading'),
    };
  }
}

class OutputRecordsBody extends ConsumerWidget {
  const OutputRecordsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final records = ref.watch(outputRecordsProvider);
    return switch (records) {
      AsyncData(:final value) => TreeView(items: value),
      _ => const Text('loading'),
    };
  }
}
