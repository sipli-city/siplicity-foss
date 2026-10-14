import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'treeselection_provider.g.dart';

@Riverpod(keepAlive: true)
class InputSelection extends _$InputSelection {
  @override
  Iterable<int> build() {
    return [];
  }

  void selectionChanged(Iterable<int> selection) {
    state = selection;
  }
}

@Riverpod(keepAlive: true)
class OutputSelection extends _$OutputSelection {
  @override
  Iterable<int> build() {
    return [];
  }

  void selectionChanged(Iterable<int> selection) {
    state = selection;
  }
}
