import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

part 'filter_provider.g.dart';

@Riverpod(keepAlive: true)
class GraphTyp extends _$GraphTyp {
  @override
  GraphType build() {
    return GraphType.GRAPH_TYPE_INPUT;
  }

  void set(GraphType typ) {
    state = typ;
  }
}

@Riverpod(keepAlive: true)
class QueryString extends _$QueryString {
  @override
  String? build() {
    return null;
  }

  void set(String? query) {
    state = query;
  }
}

@Riverpod(keepAlive: true)
class RecordTypes extends _$RecordTypes {
  @override
  Iterable<RecordType>? build() {
    return null;
  }

  void set(int i) {
    switch (i) {
      case 0:
        state = null;
      case 1:
        state = [
          RecordType.RECORD_TYPE_FILE,
          RecordType.RECORD_TYPE_VIRTUAL_FILE
        ];
      case 2:
        state = [
          RecordType.RECORD_TYPE_DIRECTORY,
          RecordType.RECORD_TYPE_VIRTUAL_DIRECTORY,
          RecordType.RECORD_TYPE_ARCHIVE,
          RecordType.RECORD_TYPE_VIRTUAL_ARCHIVE
        ];
    }
  }

  int asInt() {
    if (state == null) return 0;
    if (state!.contains(RecordType.RECORD_TYPE_FILE)) return 1;
    if (state!.contains(RecordType.RECORD_TYPE_DIRECTORY)) return 2;
    return 0;
  }

  bool includesRoot() {
    return state?.contains(RecordType.RECORD_TYPE_ROOT) ?? true;
  }
}
