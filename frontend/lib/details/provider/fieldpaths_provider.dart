import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

part 'fieldpaths_provider.g.dart';

@riverpod
class Fieldpaths extends _$Fieldpaths {
  @override
  List<FieldPath> build() {
    return [];
  }

    void confirmSelection(List<List<(String, String, int)>> selection) {
    state = selection.map((li) {
      return FieldPath(entries: li.map((e) => FieldPath_Entry(namespace: e.$1, name: e.$2, index: e.$3)));
    }).toList();
  }

  List<List<(String,String, int)>> asSelection() {
    return state.map((fp) {return fp.entries.map((e) => (e.namespace, e.name, e.index)).toList();}).toList();
  }
}
