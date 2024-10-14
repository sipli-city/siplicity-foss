import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pane_provider.g.dart';

@Riverpod(keepAlive: true)
class PaneSelection extends _$PaneSelection {
  @override
  int build() {
    return 0;
  }

  void paneChanged(int pane) {
    state = pane;
  }
}
