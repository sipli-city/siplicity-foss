import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';
import 'package:siplicity/client.dart';

part 'fieldpaths_provider.g.dart';

@riverpod
class Fieldpaths extends _$Fieldpaths {
  @override
  Iterable<FieldPath>? build() {
    return null;
  }
  
  FieldPath? nth(int index) {
    if (state == null || index < 0 || index >= state!.length) {
      return null;
    }
    return state!.elementAt(index);
  }

  void confirmSelection(List<List<(String, String, int)>> selection) {
    state = selection.map((li) {
      return FieldPath(entries: li.map((e) => FieldPath_Entry(namespace: e.$1, name: e.$2, index: e.$3)));
    });
  }

  List<List<(String,String, int)>> asSelection() {
    if (state == null) {
      return [];
    }
    return state!.map((fp) {return fp.entries.map((e) => (e.namespace, e.name, e.index)).toList();}).toList();
  }

  List<String> asTitles() {
    if (state == null) {
      return [];
    }
    return state!.map((fp) => '${fp.entries.last.name} (${fp.entries.last.namespace})').toList();
  }

  Future<void> putValue(int id, int index, String value) async {
     final path = nth(index);
     if (path == null) {
      return;
     }
     final field = Field(namespace: path.entries.last.namespace, name: path.entries.last.name, value: value);
     await siplicityServiceClient.updateField(UpdateFieldRequest(id: id, path: path, overwrite: true, field_4: field));
  }
}

