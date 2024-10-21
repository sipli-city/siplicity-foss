import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

part 'fieldpaths_provider.g.dart';

@riverpod
class Fieldpaths extends _$Fieldpaths {
  @override
  List<FieldPath> build() {
    return [];
  }

    void confirmSelection(List<(String, String, int)> selection) {
    state = [];
  }

  List<(String,String, int)> asSelection() {
    return [];
  }
}
