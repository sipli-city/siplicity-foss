import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:siplicity/protogen/siplicity/v1/siplicity.pb.dart';

part 'fieldselection_provider.g.dart';

@Riverpod(keepAlive: true)
class FieldSelection extends _$FieldSelection {
  @override
  Iterable<FieldPath>? build() {
    return null;
  }

  void selectionChanged(Iterable<FieldPath>? selection) {
    state = selection;
  }
}
